# Linux CLI — Users, Groups and Identity

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 150. Users

Show current user:

```bash
whoami
```

Show user identity and groups:

```bash
id
```

---

# 151. `who`

Show logged-in users:

```bash
who
```

---

# 152. `w`

Shows logged-in users and activity:

```bash
w
```

---

# 153. `users`

Simple list of logged-in usernames:

```bash
users
```

---

# 154. `/etc/passwd`

Contains user account information.

View:

```bash
cat /etc/passwd
```

A typical entry resembles:

```text
username:x:1000:1000:User Name:/home/username:/bin/bash
```

Important fields:

```text
username
password placeholder
UID
GID
GECOS/comment
home directory
login shell
```

Modern Linux systems do not normally store actual password hashes in `/etc/passwd`.

---

# 155. `/etc/shadow`

Contains password hashes and password-aging information.

```bash
sudo cat /etc/shadow
```

Access is restricted because it contains sensitive authentication information.

---

# 156. `/etc/group`

Contains group definitions.

```bash
cat /etc/group
```

---

# 157. User ID

Check:

```bash
id username
```

UID identifies the user.

---

# 158. Group ID

GID identifies the primary group.

---

# 159. Creating Users

On many Linux distributions:

```bash
sudo useradd username
```

A more interactive/high-level command may be:

```bash
sudo adduser username
```

The exact behavior differs by distribution.

---

# 160. Setting Password

```bash
sudo passwd username
```

---

# 161. Deleting Users

```bash
sudo userdel username
```

Remove the home directory too:

```bash
sudo userdel -r username
```

Use carefully.

---

# 162. Creating Groups

```bash
sudo groupadd developers
```

---

# 163. Adding User to Group

On many Linux systems:

```bash
sudo usermod -aG developers username
```

Important:

```text
-a → append
-G → supplementary groups
```

Without `-a`, you may replace the user's supplementary group list.

---

# 164. Viewing Groups

```bash
groups
```

or:

```bash
id
```

---

# 165. Switching User

```bash
su - username
```

The `-` requests a login shell environment.

---

# 166. `sudo` vs `su`

```text
sudo command
```

Runs a command with elevated privileges according to sudo policy.

```text
su - username
```

Switches to another user's account.

---
