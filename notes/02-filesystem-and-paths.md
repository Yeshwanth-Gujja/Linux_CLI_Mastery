# Linux CLI — Filesystem and Paths

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 22. Linux Filesystem

Linux uses a hierarchical filesystem.

The root of the filesystem is:

```text
/
```

Important directories:

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

---

# 23. Root Directory `/`

```bash
cd /
```

`/` is the filesystem root.

Do not confuse:

```text
/
```

with:

```text
/root
```

`/root` is the root user's home directory.

---

# 24. `/home`

Contains normal users' home directories.

Example:

```text
/home/yeshwanth
/home/alice
/home/bob
```

---

# 25. `/root`

Home directory of the root user.

```text
/root
```

It is different from:

```text
/home/root
```

---

# 26. `/etc`

Contains system configuration files.

Examples:

```text
/etc/hosts
/etc/passwd
/etc/group
/etc/ssh/
/etc/systemd/
```

---

# 27. `/var`

Contains variable data.

Examples:

```text
/var/log
/var/cache
/var/lib
/var/tmp
```

Logs are commonly stored under:

```text
/var/log
```

---

# 28. `/tmp`

Temporary files.

```text
/tmp
```

Do not assume files in `/tmp` are permanent.

---

# 29. `/usr`

Contains many user-space programs, libraries, and shared resources.

Common directories:

```text
/usr/bin
/usr/sbin
/usr/lib
/usr/share
```

---

# 30. `/bin`

Traditionally contains essential user commands.

On many modern distributions, `/bin` may be a symbolic link to:

```text
/usr/bin
```

---

# 31. `/sbin`

Traditionally contains system administration commands.

Modern distributions may merge this into `/usr/bin` through symlinks.

---

# 32. `/dev`

Contains device files.

Examples:

```text
/dev/null
/dev/zero
/dev/random
/dev/sda
```

---

# 33. `/proc`

A virtual filesystem exposing process and kernel information.

Example:

```bash
ls /proc
```

Current process information:

```bash
ls /proc/$$
```

---

# 34. `/sys`

Provides information and interfaces related to devices, drivers, and the kernel.

---

# 35. `/boot`

Contains files required for booting the system.

Examples may include:

```text
vmlinuz
initramfs
grub/
```

---

# 36. `/media`

Common mount location for removable media.

---

# 37. `/mnt`

Common temporary mount location.

---

# 38. `/opt`

Often used for optional/additional software packages.

---

# 39. `/srv`

Data served by system services.

---

# 40. `/run`

Runtime data created since boot.

---

# 41. Current Working Directory

Use:

```bash
pwd
```

`pwd` means:

```text
Print Working Directory
```

Example:

```text
/home/yeshwanth/projects
```

---

# 42. `cd`

Change directory.

```bash
cd /home
```

---

# 43. Home Directory

```bash
cd ~
```

or simply:

```bash
cd
```

`~` represents the current user's home directory.

---

# 44. Parent Directory

```bash
cd ..
```

`..` means the parent directory.

---

# 45. Current Directory

```text
.
```

Example:

```bash
./script.sh
```

means execute `script.sh` from the current directory.

---

# 46. Root Path vs Relative Path

Absolute:

```bash
cd /home/yeshwanth/projects
```

Relative:

```bash
cd projects
```

An absolute path begins at `/`.

A relative path is interpreted from the current working directory.

---
