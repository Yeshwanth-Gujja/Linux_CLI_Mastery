# Linux CLI — System Information and Storage

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 190. System Information

## `uname`

```bash
uname -a
```

Displays kernel/system information.

---

# 191. Kernel Version

```bash
uname -r
```

---

# 192. CPU Information

```bash
lscpu
```

---

# 193. Memory Information

```bash
free -h
```

---

# 194. Detailed Memory

```bash
cat /proc/meminfo
```

---

# 195. Disk Space

```bash
df -h
```

Shows filesystem disk usage.

---

# 196. Directory Size

```bash
du -sh directory/
```

---

# 197. Largest Items

Example:

```bash
du -ah . | sort -h | tail
```

This can help identify large files/directories.

---

# 198. Mounted Filesystems

```bash
mount
```

or:

```bash
findmnt
```

---

# 199. Block Devices

```bash
lsblk
```

Shows disks, partitions, and block-device relationships.

---

# 200. Disk Partition Information

```bash
sudo fdisk -l
```

Use caution with partition-management tools.

---

# 201. File Descriptors

Linux processes interact with files and many resources through file descriptors.

Common descriptors:

```text
0 → stdin
1 → stdout
2 → stderr
```

Check a process:

```bash
ls -l /proc/PID/fd
```

---
