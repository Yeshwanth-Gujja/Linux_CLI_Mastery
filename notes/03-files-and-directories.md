# Linux CLI — Files and Directories

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 47. `ls`

Lists directory contents.

```bash
ls
```

---

# 48. `ls -l`

Long listing:

```bash
ls -l
```

Example:

```text
-rw-r--r-- 1 yesh yesh 1200 Sep 30 10:00 notes.txt
```

---

# 49. `ls -a`

Shows hidden files.

```bash
ls -a
```

Hidden filenames normally begin with:

```text
.
```

Examples:

```text
.bashrc
.gitconfig
.ssh
```

---

# 50. `ls -h`

Human-readable sizes:

```bash
ls -lh
```

---

# 51. Useful `ls` Combinations

```bash
ls -lah
```

Means:

```text
-l → long format
-a → hidden files
-h → human-readable sizes
```

---

# 52. Creating Directories

```bash
mkdir projects
```

---

# 53. Nested Directories

```bash
mkdir -p projects/linux/notes
```

`-p` creates missing parent directories.

---

# 54. Creating Files

Common approaches include:

```bash
touch notes.txt
```

`touch` creates an empty file if it does not exist.

It can also update timestamps on an existing file.

---

# 55. `cat`

Display file contents:

```bash
cat notes.txt
```

---

# 56. `less`

View large files page by page:

```bash
less notes.txt
```

Useful controls:

```text
Space → next page
b     → previous page
/word → search
n     → next match
q     → quit
```

---

# 57. `more`

Another pager:

```bash
more notes.txt
```

`less` is generally more capable.

---

# 58. `head`

Display the beginning of a file.

```bash
head notes.txt
```

Default behavior commonly shows the first 10 lines.

Specify lines:

```bash
head -n 20 notes.txt
```

---

# 59. `tail`

Display the end of a file.

```bash
tail notes.txt
```

Specify lines:

```bash
tail -n 20 notes.txt
```

---

# 60. `tail -f`

Follow a growing file:

```bash
tail -f /var/log/app.log
```

Commonly used for monitoring logs.

Exit:

```text
Ctrl + C
```

---

# 61. Copying Files

```bash
cp source.txt destination.txt
```

---

# 62. Copying Directories

Use recursive copying:

```bash
cp -r source_dir destination_dir
```

---

# 63. Moving Files

```bash
mv old.txt new.txt
```

Can rename a file.

---

# 64. Moving a File to Another Directory

```bash
mv file.txt documents/
```

---

# 65. Renaming a Directory

```bash
mv old_directory new_directory
```

---

# 66. Removing Files

```bash
rm file.txt
```

Be careful: `rm` normally does not provide a recycle-bin mechanism.

---

# 67. Removing Directories

Empty directory:

```bash
rmdir emptydir
```

Recursive removal:

```bash
rm -r directory
```

Force:

```bash
rm -rf directory
```

`rm -rf` is extremely powerful and dangerous.

Always verify the path before executing it.

---

# 68. Wildcards

## `*`

Matches many characters.

```bash
ls *.txt
```

Matches:

```text
a.txt
notes.txt
hello.txt
```

## `?`

Matches one character.

```bash
ls ?.txt
```

Matches:

```text
a.txt
b.txt
```

but not:

```text
notes.txt
```

---

# 69. Character Classes

```bash
ls [abc].txt
```

Matches:

```text
a.txt
b.txt
c.txt
```

Range:

```bash
ls [a-z].txt
```

---

# 70. Hidden Files

A filename beginning with `.` is conventionally hidden.

Examples:

```text
.bashrc
.profile
.git
```

Show them:

```bash
ls -la
```

---

# 71. File Types

Linux uses a unified filesystem model.

Common file types:

```text
-  regular file
d  directory
l  symbolic link
c  character device
b  block device
p  named pipe
s  socket
```

Check with:

```bash
ls -l
```

---

# 72. `file`

Determine what kind of file something is:

```bash
file notes.txt
```

Example:

```text
notes.txt: ASCII text
```

---

# 73. File Extensions

Linux does not require extensions to identify file types.

For example:

```text
script
script.sh
```

can both be executable files.

The extension is primarily a naming convention.

---

# 74. Symbolic Links

Create a symbolic link:

```bash
ln -s target linkname
```

Example:

```bash
ln -s /var/log/app.log app.log
```

A symbolic link stores a path/reference to another file.

---

# 75. Hard Links

Create:

```bash
ln original.txt hardlink.txt
```

A hard link refers to the same underlying inode/data as the original file.

Important distinction:

```text
Symbolic link → points to a path
Hard link      → points to the same inode
```

---
