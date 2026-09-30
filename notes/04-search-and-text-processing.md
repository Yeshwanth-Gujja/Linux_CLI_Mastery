# Linux CLI — Search and Text Processing

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 76. Inodes

An inode stores filesystem metadata about a file, such as:

- File type
- Permissions
- Owner
- Group
- Size
- Timestamps
- Link count
- Pointers/references to file data

Filename information is associated with directory entries rather than being the inode itself.

---

# 77. `stat`

Display detailed file metadata:

```bash
stat notes.txt
```

---

# 78. File Timestamps

Important timestamps include:

```text
atime → access time
mtime → modification time
ctime → metadata/status change time
```

On Linux filesystems, `ctime` is **not** creation time.

Some filesystems also expose birth time when supported.

---

# 79. `touch`

Create/update timestamps:

```bash
touch file.txt
```

Set a specific modification/access time:

```bash
touch -t 202609301200 file.txt
```

---

# 80. Searching Files with `find`

Basic:

```bash
find . -name "notes.txt"
```

Search recursively from the current directory.

---

# 81. Find by Extension

```bash
find . -name "*.txt"
```

---

# 82. Find by Type

Files:

```bash
find . -type f
```

Directories:

```bash
find . -type d
```

Symbolic links:

```bash
find . -type l
```

---

# 83. Find by Size

```bash
find . -size +100M
```

Find files larger than approximately 100 MB.

---

# 84. Find by Modification Time

```bash
find . -mtime -1
```

Files modified within the last day.

---

# 85. Find and Execute

```bash
find . -name "*.log" -exec wc -l {} \;
```

`{}` is replaced by each matching path.

---

# 86. `locate`

```bash
locate notes.txt
```

Uses a prebuilt database.

It is usually faster than `find`, but the database may not contain the newest files.

---

# 87. `grep`

Search text inside files.

```bash
grep "error" log.txt
```

---

# 88. Case-Insensitive Search

```bash
grep -i "error" log.txt
```

---

# 89. Recursive Search

```bash
grep -r "TODO" .
```

Searches recursively.

---

# 90. Show Line Numbers

```bash
grep -n "error" log.txt
```

---

# 91. Invert Match

```bash
grep -v "debug" log.txt
```

Shows lines that do not match.

---

# 92. Count Matches

```bash
grep -c "error" log.txt
```

---

# 93. Extended Regular Expressions

```bash
grep -E "error|warning" log.txt
```

Searches for either `error` or `warning`.

---

# 94. `grep` with Pipes

```bash
ps aux | grep nginx
```

A common CLI pattern.

---

# 95. `wc`

Word/line/byte counting.

```bash
wc file.txt
```

Options:

```bash
wc -l file.txt
wc -w file.txt
wc -c file.txt
```

Meaning:

```text
-l → lines
-w → words
-c → bytes
```

---

# 96. `sort`

Sort lines:

```bash
sort names.txt
```

Reverse:

```bash
sort -r names.txt
```

Numeric:

```bash
sort -n numbers.txt
```

---

# 97. `uniq`

Remove adjacent duplicate lines:

```bash
uniq names.txt
```

Usually combine with `sort`:

```bash
sort names.txt | uniq
```

Count duplicates:

```bash
sort names.txt | uniq -c
```

---

# 98. `cut`

Extract fields or characters.

Example:

```bash
cut -d: -f1 /etc/passwd
```

Meaning:

```text
-d: → delimiter is :
-f1 → select field 1
```

---

# 99. `tr`

Translate or delete characters.

Convert lowercase to uppercase:

```bash
echo "hello" | tr 'a-z' 'A-Z'
```

---

# 100. `tee`

Reads standard input and writes it both to standard output and a file.

```bash
echo "Hello" | tee output.txt
```

Append:

```bash
echo "World" | tee -a output.txt
```

---
