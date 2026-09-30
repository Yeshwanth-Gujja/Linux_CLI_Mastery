# Linux CLI — Troubleshooting, Interview and Learning

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 301. Essential Command Cheat Sheet

```bash
pwd
ls
ls -la
cd
cd ..
cd ~
mkdir
mkdir -p
touch
cp
cp -r
mv
rm
rm -r
cat
less
head
tail
tail -f
find
grep
sort
uniq
cut
sed
awk
wc
file
stat
ln
ln -s
chmod
chown
chgrp
umask
whoami
id
groups
ps
ps aux
top
kill
pkill
pgrep
jobs
fg
bg
df -h
du -sh
free -h
uname -a
lscpu
ip addr
ip route
ping
ss
curl
wget
ssh
scp
rsync
dig
systemctl
journalctl
crontab
tar
zip
unzip
man
history
```

---

# 302. Linux CLI Troubleshooting Workflow

When something goes wrong, use a structured process.

## Step 1 — Identify where you are

```bash
pwd
```

## Step 2 — Inspect the directory

```bash
ls -la
```

## Step 3 — Identify the file

```bash
file filename
```

## Step 4 — Check permissions

```bash
ls -l filename
```

## Step 5 — Check ownership

```bash
stat filename
```

## Step 6 — Check the process

```bash
ps aux | grep program
```

## Step 7 — Check logs

```bash
journalctl -u service
```

or:

```bash
tail -f /var/log/application.log
```

## Step 8 — Check networking

```bash
ip addr
ip route
ping host
ss -tuln
```

## Step 9 — Check disk

```bash
df -h
du -sh directory
```

## Step 10 — Check documentation

```bash
man command
```

---

# 303. Linux CLI Interview Questions

## Fundamentals

### What is CLI?

A command-line interface allows users to interact with a computer through textual commands.

### What is a shell?

A shell interprets commands and executes them.

### What is Bash?

Bash is the Bourne Again SHell, a widely used Unix/Linux shell.

### Terminal vs shell?

A terminal provides an interface; the shell interprets commands inside it.

---

# 304. Filesystem Questions

### What is `/`?

The root of the Linux filesystem.

### What is `/home`?

Typically contains normal users' home directories.

### What is `/etc`?

System configuration.

### What is `/var`?

Variable application/system data such as logs and caches.

### What is `/tmp`?

Temporary data.

### What is `/proc`?

A virtual filesystem exposing process/kernel information.

---

# 305. Permissions Questions

### What does `755` mean?

```text
rwxr-xr-x
```

Owner:

```text
rwx
```

Group:

```text
r-x
```

Others:

```text
r-x
```

### What does `644` mean?

```text
rw-r--r--
```

### What does `chmod` do?

Changes permissions.

### What does `chown` do?

Changes ownership.

### What does `umask` do?

Controls which permissions are masked when new files/directories are created.

---

# 306. Process Questions

### What is PID?

Process ID.

### What is PPID?

Parent Process ID.

### `kill` vs `kill -9`?

`kill` normally sends SIGTERM; `kill -9` sends SIGKILL.

### Why should SIGKILL not be the first choice?

SIGTERM allows the process to clean up and exit gracefully; SIGKILL cannot be handled by the target.

---

# 307. Networking Questions

### What does `ip addr` show?

Network interfaces and IP addresses.

### What does `ip route` show?

Routing information.

### What does `ss` show?

Socket information.

### What does `curl` do?

Transfers data using URLs and is widely used for HTTP/API interaction.

### What does SSH do?

Provides secure remote shell access and other secure transport functionality.

---

# 308. Storage Questions

### `df` vs `du`

```text
df → filesystem free/used space
du → space consumed by files/directories
```

### `lsblk`

Shows block devices and their relationships.

---

# 309. Shell Questions

### What does `$?` mean?

Exit status of the most recently executed foreground pipeline/command context.

### What does `$0` mean in a script?

The script/command name as received by the shell.

### What does `$1` mean?

First positional argument.

### What does `$#` mean?

Number of positional arguments.

### What does `$@` mean?

The positional parameters, especially when used as `"$@"` to preserve argument boundaries.

---

# 310. Redirection Questions

### What is `>`?

Redirect stdout and overwrite the target file.

### What is `>>`?

Redirect stdout and append.

### What is `2>`?

Redirect stderr.

### What is `|`?

Pipe stdout from one command to stdin of another.

### What is `/dev/null`?

A special device that discards written data.

---

# 311. Practical Command Chains

Find errors in a log:

```bash
grep -i "error" application.log
```

Count them:

```bash
grep -i "error" application.log | wc -l
```

Count unique error lines:

```bash
grep -i "error" application.log | sort | uniq -c
```

Find large files:

```bash
find . -type f -size +100M
```

Find a process:

```bash
ps aux | grep nginx
```

Find listening services:

```bash
ss -tuln
```

Check disk:

```bash
df -h
```

Check memory:

```bash
free -h
```

Check service logs:

```bash
journalctl -u nginx
```

---

# 312. The Linux CLI Mental Model

The most important conceptual model is:

```text
User
  ↓
Terminal
  ↓
Shell
  ↓
Command
  ↓
Process
  ↓
Kernel
  ↓
Hardware / Filesystem / Network
```

A command generally:

```text
Input
  ↓
Shell parsing
  ↓
Expansion
  ↓
Program execution
  ↓
stdin / stdout / stderr
  ↓
Exit status
```

---

# 313. Linux CLI Learning Order

For learning and interviews, master the concepts in this order:

```text
1. Terminal
2. Shell
3. Bash
4. Command syntax
5. pwd
6. ls
7. cd
8. mkdir
9. touch
10. cp
11. mv
12. rm
13. cat
14. less
15. head / tail
16. find
17. grep
18. pipes
19. redirection
20. stdin/stdout/stderr
21. variables
22. environment variables
23. PATH
24. permissions
25. chmod
26. chown
27. users/groups
28. sudo
29. processes
30. ps
31. top
32. kill
33. jobs
34. systemctl
35. journalctl
36. disk management
37. networking
38. SSH
39. package management
40. archives
41. Bash scripting
42. text processing
43. automation
44. troubleshooting
```

---

# 314. Final Linux CLI Reference

If you remember only the fundamental commands initially, remember this set:

```bash
pwd                 # Where am I?
ls -la              # What is here?
cd                  # Move
mkdir               # Create directory
touch               # Create/update file
cp                  # Copy
mv                  # Move/rename
rm                  # Remove
cat                 # Display
less                # Read interactively
head                # Beginning
tail                # End
find                # Find files
grep                # Find text
sort                # Sort
uniq                # Deduplicate
wc                  # Count
cut                 # Extract fields
sed                 # Transform text
awk                 # Process structured text
chmod               # Permissions
chown               # Ownership
whoami              # Current user
id                  # Identity/groups
sudo                # Elevated command
ps                  # Processes
top                 # Process monitor
kill                # Send signal
df -h               # Filesystem space
du -sh              # Directory space
free -h             # Memory
ip addr             # Network addresses
ip route            # Routes
ss -tuln            # Listening sockets
ping                # Connectivity test
curl                # HTTP/data transfer
ssh                 # Remote shell
scp                 # Secure copy
rsync               # Synchronization
systemctl           # Services
journalctl          # Systemd logs
tar                 # Archives
man                 # Documentation
history             # Command history
```

The central skill is not memorizing hundreds of commands. It is understanding how **commands, arguments, options, paths, permissions, processes, pipes, redirection, environment variables, and exit statuses interact**. Once that model is clear, the Linux CLI becomes much easier to learn and troubleshoot.
