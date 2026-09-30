# Linux CLI Mastery — Deep Dives and Gaps Filled

This file contains important CLI-adjacent Linux concepts that deserve a standalone treatment beyond the original command-by-command notes.

## 1. Shell Parsing Order

A useful Bash mental model is:

```text
input line
  ↓
lexing / tokenization
  ↓
quotes and escapes
  ↓
parameter expansion / command substitution / arithmetic expansion
  ↓
pathname expansion (globbing)
  ↓
redirection setup
  ↓
command lookup
  ↓
execution
```

The exact shell grammar is more nuanced, but this model explains many practical surprises.

## 2. Shell Builtins vs External Commands

Use `type`, `command -V`, or `help` to distinguish them:

```bash
type cd
type echo
type grep
help cd
```

Builtins can modify the current shell state. That is why `cd` must be a shell builtin (or otherwise executed in the current shell) to change the caller's working directory.

## 3. Login, Interactive and Non-Interactive Shells

Do not assume every Bash startup file is read in every situation. The files and order depend on whether Bash is a login shell, interactive shell, or non-interactive shell, and distribution conventions can add system-wide files.

Useful checks:

```bash
echo "$0"
shopt -q login_shell; echo $?
ps -p $$ -o pid,ppid,args
```

## 4. `/proc` as a Process Interface

Useful examples:

```bash
cat /proc/$$/cmdline
tr '\0' ' ' < /proc/$$/cmdline; echo
cat /proc/$$/status
readlink -f /proc/$$/cwd
readlink -f /proc/$$/exe
ls -l /proc/$$/fd
```

This makes the relationship between processes, file descriptors, executable images, and the kernel more concrete.

## 5. Filesystem Mounts and `/etc/fstab`

A filesystem can be attached to the directory tree through a mount point. Inspect mounts with:

```bash
findmnt
findmnt /
lsblk -f
```

`/etc/fstab` describes filesystems that may be mounted automatically. Prefer stable identifiers such as UUIDs rather than assuming device names will never change:

```bash
blkid
```

Never edit or apply mount configuration blindly on a production machine. Validate with `mount -a` in an appropriate maintenance context.

## 6. LVM Mental Model

Logical Volume Manager commonly follows:

```text
physical disks / partitions
        ↓
physical volumes (PV)
        ↓
volume group (VG)
        ↓
logical volumes (LV)
        ↓
filesystem
        ↓
mount point
```

Useful inspection commands:

```bash
pvs
vgs
lvs
lsblk
```

Resizing storage is filesystem-specific; expanding a block device and expanding the filesystem are separate operations.

## 7. ACLs

Traditional Unix permissions are not always enough for fine-grained access. POSIX ACLs can provide additional user/group entries.

```bash
getfacl file.txt
setfacl -m u:alice:r file.txt
```

An ACL does not replace the need to understand the owner/group/mode bits; it extends the access-control model.

## 8. Linux Capabilities

Capabilities split some root-like privileges into smaller units. This matters when a program needs a specific privileged operation without unrestricted root authority.

Inspect process capabilities with tools such as:

```bash
getcap /path/to/program
capsh --print
```

Treat capability changes as security-sensitive configuration.

## 9. SELinux and AppArmor

Linux access control can include mandatory access-control frameworks in addition to traditional mode bits. Common examples are SELinux and AppArmor.

Do not conclude that a file is accessible merely because `ls -l` looks correct. A security policy can still deny the operation.

Useful discovery commands vary by distribution, for example:

```bash
getenforce
sestatus
apparmor_status
```

## 10. Systemd Unit Mental Model

`systemctl` is not only about services. systemd manages units such as services, sockets, mounts, timers, targets, and paths.

```bash
systemctl list-units
systemctl list-unit-files
systemctl cat nginx.service
systemctl show nginx.service
```

When debugging a service, distinguish:

```text
unit configuration
→ dependency ordering
→ process startup
→ runtime logs
→ resource/security restrictions
```

## 11. Resource Limits

Per-process resource limits can explain failures that look like application bugs.

```bash
ulimit -a
cat /proc/$$/limits
```

Common limits include open files, processes, core dumps, and address-space-related limits.

## 12. Open Files and Sockets

`lsof` can connect processes to files, devices, and sockets:

```bash
lsof -p PID
lsof -i :8080
```

This is often useful when a port is unexpectedly occupied or a file cannot be unlinked/umounted because a process still holds it open.

## 13. `/etc/hosts`, `/etc/resolv.conf` and Name Resolution

Useful files for diagnosing name-resolution behavior include:

```bash
cat /etc/hosts
cat /etc/resolv.conf
getent hosts example.com
```

`getent` is particularly useful because it asks the system's configured name-service mechanisms rather than only querying DNS directly.

## 14. HTTP Troubleshooting with `curl`

A practical progression is:

```bash
curl -I https://example.com
curl -v https://example.com
curl -sS https://example.com
curl -sS -o /dev/null -w '%{http_code}\n' https://example.com
```

Separate DNS failure, TCP connection failure, TLS failure, HTTP status failure, and application-level response problems instead of treating all of them as a generic 'network issue'.

## 15. Secure Bash Defaults

For scripts where strict behavior is appropriate:

```bash
set -Eeuo pipefail
```

Use this intentionally rather than mechanically. Understand how `set -e` interacts with conditionals, pipelines, command substitutions, and expected non-zero statuses.

A safer script also validates input, quotes expansions, uses `--` where applicable, avoids parsing `ls`, and cleans up temporary resources.

## 16. Temporary Files

Prefer `mktemp` instead of predictable temporary filenames:

```bash
tmpdir=$(mktemp -d)
trap 'rm -rf -- "$tmpdir"' EXIT
```

This reduces collisions and common temporary-file race problems.

## 17. Exit Status and Pipelines

A pipeline's status has subtle semantics. Bash can expose the status of each command with `PIPESTATUS`, and `pipefail` changes the pipeline's aggregate status:

```bash
false | true
echo "$?"

set -o pipefail
false | true
echo "$?"
```

Understand this before writing automation that treats a pipeline as a single success/failure unit.

## 18. `xargs` vs `find -exec`

Prefer `find -exec ... {} +` or null-delimited `xargs -0` when handling arbitrary filenames. Never assume filenames cannot contain spaces, tabs, quotes, or newlines.

## 19. Common Production Investigation Matrix

| Symptom | First checks | Next checks |
|---|---|---|
| Command not found | `type`, `command -v`, `echo $PATH` | shell startup files, package install |
| Permission denied | `id`, `ls -l`, `namei -l` | ACLs, SELinux/AppArmor, parent directories |
| Disk full | `df -h` | `du`, deleted-open files via `lsof` |
| Port unavailable | `ss -ltnp` | `lsof -i :PORT`, service config |
| Service failed | `systemctl status` | `journalctl -u`, `systemctl cat` |
| DNS issue | `getent hosts`, `resolvectl` where available | `dig`, resolver configuration |
| High CPU | `top`, `ps` | process-specific profiling/logs |
| High memory | `free`, `ps`, `top` | process limits, OOM evidence |
| SSH failure | `ssh -v` | keys, permissions, server logs, network path |
