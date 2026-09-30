# Linux CLI — Networking and Remote Access

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 202. Networking Basics

Linux provides many CLI networking tools.

Important commands:

```text
ip
ping
ss
curl
wget
ssh
scp
dig
nslookup
traceroute
```

---

# 203. `ip`

Modern Linux networking administration commonly uses:

```bash
ip
```

Show interfaces:

```bash
ip addr
```

or:

```bash
ip a
```

---

# 204. IP Routes

```bash
ip route
```

Shows the routing table.

---

# 205. Link Information

```bash
ip link
```

---

# 206. `ping`

Tests IP-level reachability using ICMP where permitted.

```bash
ping example.com
```

Stop:

```text
Ctrl + C
```

Limit requests:

```bash
ping -c 4 example.com
```

---

# 207. `ss`

Displays socket information.

```bash
ss
```

Listening TCP/UDP sockets:

```bash
ss -tuln
```

Common flags:

```text
-t → TCP
-u → UDP
-l → listening
-n → numeric
```

---

# 208. `curl`

Transfers data from or to a URL.

```bash
curl https://example.com
```

Headers:

```bash
curl -I https://example.com
```

Download to a file:

```bash
curl -o page.html https://example.com
```

---

# 209. `wget`

Download resources:

```bash
wget https://example.com/file.zip
```

---

# 210. `ssh`

Secure Shell.

Connect to a remote machine:

```bash
ssh username@server
```

Specify a port:

```bash
ssh -p 2222 username@server
```

---

# 211. SSH Keys

Generate an SSH key pair:

```bash
ssh-keygen
```

Common modern algorithm:

```bash
ssh-keygen -t ed25519
```

Private key:

```text
~/.ssh/id_ed25519
```

Public key:

```text
~/.ssh/id_ed25519.pub
```

Never share your private key.

---

# 212. `ssh-agent`

Manages private keys for authentication:

```bash
ssh-agent
```

Add a key:

```bash
ssh-add ~/.ssh/id_ed25519
```

---

# 213. `scp`

Securely copy files over SSH.

Local → remote:

```bash
scp file.txt user@server:/home/user/
```

Remote → local:

```bash
scp user@server:/home/user/file.txt .
```

---

# 214. `rsync`

Efficient file synchronization.

```bash
rsync -av source/ destination/
```

Remote:

```bash
rsync -av project/ user@server:/home/user/project/
```

---

# 215. DNS

DNS translates domain names to network information.

Examples:

```text
example.com
     ↓
IP address
```

---

# 216. `dig`

Query DNS:

```bash
dig example.com
```

A record:

```bash
dig example.com A
```

MX record:

```bash
dig example.com MX
```

---

# 217. `nslookup`

Another DNS lookup utility:

```bash
nslookup example.com
```

`dig` is generally preferred for detailed DNS troubleshooting.

---

# 218. `hostname`

Show hostname:

```bash
hostname
```

---

# 219. `hostnamectl`

On systems using systemd:

```bash
hostnamectl
```

Can display and manage hostname-related system information.

---

# 220. Package Management

Package management depends on the Linux distribution.

Common ecosystems:

```text
Debian/Ubuntu → apt
Fedora/RHEL   → dnf
Arch          → pacman
openSUSE      → zypper
```

---
