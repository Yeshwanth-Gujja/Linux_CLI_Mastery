# Linux CLI — Packages, Services, Scheduling and Archives

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 221. APT

Update package metadata:

```bash
sudo apt update
```

Upgrade installed packages:

```bash
sudo apt upgrade
```

Install:

```bash
sudo apt install package
```

Remove:

```bash
sudo apt remove package
```

---

# 222. APT Search

```bash
apt search nginx
```

Show package information:

```bash
apt show nginx
```

---

# 223. APT Removal with Configuration

```bash
sudo apt purge package
```

This can remove package configuration files managed by the package.

---

# 224. DNF

Fedora/RHEL-family systems commonly use:

```bash
sudo dnf install package
```

Update:

```bash
sudo dnf upgrade
```

Remove:

```bash
sudo dnf remove package
```

---

# 225. Pacman

Arch Linux:

```bash
sudo pacman -S package
```

Synchronize and upgrade:

```bash
sudo pacman -Syu
```

Remove:

```bash
sudo pacman -R package
```

---

# 226. Processes vs Services

A **process** is a running instance of a program.

A **service** is a background system component typically managed as a long-running unit.

Modern Linux distributions commonly use:

```text
systemd
```

for service management.

---

# 227. `systemctl`

Check service status:

```bash
systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

---

# 228. Enable Service at Boot

```bash
sudo systemctl enable nginx
```

Enable and start immediately:

```bash
sudo systemctl enable --now nginx
```

---

# 229. Disable Service

```bash
sudo systemctl disable nginx
```

---

# 230. List Running Services

```bash
systemctl --type=service
```

---

# 231. Logs with `journalctl`

View systemd journal:

```bash
journalctl
```

Current boot:

```bash
journalctl -b
```

Follow logs:

```bash
journalctl -f
```

Specific service:

```bash
journalctl -u nginx
```

---

# 232. Scheduled Tasks

Linux supports scheduled execution.

Important tools:

```text
cron
crontab
at
systemd timers
```

---

# 233. `crontab`

Edit your cron jobs:

```bash
crontab -e
```

View:

```bash
crontab -l
```

---

# 234. Cron Format

Typical format:

```text
minute hour day-of-month month day-of-week command
```

Example:

```text
0 2 * * * /home/user/backup.sh
```

Means approximately:

```text
Every day at 02:00
```

---

# 235. Cron Wildcards

```text
* → every value
```

Example:

```text
*/5 * * * *
```

Runs every five minutes.

---

# 236. `at`

Schedule a command for a one-time future execution.

Example:

```bash
echo "/home/user/script.sh" | at 18:00
```

Availability depends on system configuration/service.

---

# 237. Archives

Linux commonly uses:

```text
tar
gzip
bzip2
xz
zip
```

---

# 238. `tar`

Create archive:

```bash
tar -cf archive.tar files/
```

Extract:

```bash
tar -xf archive.tar
```

---

# 239. Gzip Compression

Create compressed tar archive:

```bash
tar -czf archive.tar.gz files/
```

Extract:

```bash
tar -xzf archive.tar.gz
```

---

# 240. XZ

```bash
tar -cJf archive.tar.xz files/
```

Extract:

```bash
tar -xJf archive.tar.xz
```

---

# 241. Bzip2

```bash
tar -cjf archive.tar.bz2 files/
```

Extract:

```bash
tar -xjf archive.tar.bz2
```

---

# 242. ZIP

Create:

```bash
zip -r archive.zip directory/
```

Extract:

```bash
unzip archive.zip
```

---

# 243. Compression vs Archive

Important distinction:

```text
tar  → archive multiple files
gzip → compress data
zip  → archive + compression format
```

A `.tar.gz` file means:

```text
tar archive
    +
gzip compression
```

---
