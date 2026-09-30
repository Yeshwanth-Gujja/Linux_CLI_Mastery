# Linux CLI — Permissions, Ownership and Security

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 130. Permissions

Linux permissions control access to files and directories.

Three basic permission types:

```text
r → read
w → write
x → execute
```

Three basic ownership categories:

```text
u → user/owner
g → group
o → others
```

---

# 131. Reading `ls -l`

Example:

```text
-rwxr-xr-- 1 yesh developers 1200 Sep 30 10:00 script.sh
```

Breakdown:

```text
-          → regular file
rwx        → owner permissions
r-x        → group permissions
r--        → others permissions
yesh       → owner
developers → group
1200       → size
```

---

# 132. Directory Permissions

For directories:

```text
r → list directory entries
w → create/delete/rename entries
x → access/traverse the directory
```

This is an important distinction.

A directory's `x` permission is not "execute the directory."

It means traversal/search access.

---

# 133. `chmod`

Change permissions.

Symbolic:

```bash
chmod u+x script.sh
```

Adds execute permission for the owner.

---

# 134. Remove Permission

```bash
chmod u-x script.sh
```

---

# 135. Group Permission

```bash
chmod g+w file.txt
```

---

# 136. Others Permission

```bash
chmod o-r file.txt
```

---

# 137. Numeric Permissions

Permissions have numeric values:

```text
r = 4
w = 2
x = 1
```

Therefore:

```text
rwx = 7
rw- = 6
r-x = 5
r-- = 4
-wx = 3
-w- = 2
--x = 1
--- = 0
```

---

# 138. `chmod 755`

```bash
chmod 755 script.sh
```

Means:

```text
Owner  → rwx → 7
Group  → r-x → 5
Others → r-x → 5
```

---

# 139. `chmod 644`

```bash
chmod 644 file.txt
```

Means:

```text
Owner  → rw-
Group  → r--
Others → r--
```

---

# 140. Recursive Permissions

```bash
chmod -R 755 directory/
```

Be careful with recursive permission changes.

Blindly applying `755` to an entire project can make files executable unnecessarily.

---

# 141. `chown`

Change ownership.

```bash
sudo chown user file.txt
```

Change owner and group:

```bash
sudo chown user:group file.txt
```

---

# 142. `chgrp`

Change group ownership:

```bash
sudo chgrp developers file.txt
```

---

# 143. Recursive Ownership

```bash
sudo chown -R user:group directory/
```

Again, verify the path before applying recursively.

---

# 144. Default Permissions and `umask`

`umask` controls which permission bits are removed when new files/directories are created.

Check:

```bash
umask
```

Example:

```text
0022
```

The exact resulting permissions depend on the program's creation mode and the umask.

---

# 145. Special Permissions

Linux also has:

```text
setuid
setgid
sticky bit
```

---

# 146. Setuid

Setuid on an executable causes the program to execute with the effective user ID of the file owner.

Numeric value:

```text
4000
```

Example representation:

```text
-rwsr-xr-x
```

This is security-sensitive.

---

# 147. Setgid

On executables, setgid affects effective group privileges.

On directories, setgid causes newly created files/subdirectories to inherit the directory's group in common Unix/Linux semantics.

Numeric value:

```text
2000
```

---

# 148. Sticky Bit

Commonly used on shared directories such as:

```text
/tmp
```

It prevents users from deleting/renaming files they do not own in a writable shared directory, subject to directory ownership and privilege rules.

Numeric value:

```text
1000
```

---

# 149. `umask`, `chmod`, `chown`

Remember:

```text
umask → default permission restriction
chmod → permission bits
chown → owner/group ownership
```

---
