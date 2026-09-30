# Linux CLI — Streams, Pipes and Redirection

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 101. Standard Streams

Every normal process has three standard streams:

```text
0 → stdin
1 → stdout
2 → stderr
```

---

# 102. Standard Input

```text
stdin
```

Usually comes from the keyboard.

---

# 103. Standard Output

```text
stdout
```

Normally appears in the terminal.

---

# 104. Standard Error

```text
stderr
```

Used for error/diagnostic output.

---

# 105. Output Redirection

Write output to a file:

```bash
ls > files.txt
```

`>` overwrites the file.

---

# 106. Append Output

```bash
ls >> files.txt
```

`>>` appends instead of replacing existing content.

---

# 107. Redirect Standard Error

```bash
command 2> errors.txt
```

---

# 108. Redirect Both Output and Error

Modern Bash:

```bash
command > output.txt 2>&1
```

Or:

```bash
command &> output.txt
```

The latter is Bash-specific.

---

# 109. Discard Output

```bash
command > /dev/null
```

Discard errors:

```bash
command 2> /dev/null
```

Discard both:

```bash
command > /dev/null 2>&1
```

---

# 110. `/dev/null`

`/dev/null` is a special device that discards data written to it.

Think:

```text
/dev/null = data sink
```

---

# 111. `/dev/zero`

Produces a stream of zero bytes.

```bash
head -c 10 /dev/zero
```

---

# 112. `/dev/random` and `/dev/urandom`

Provide kernel-generated random data.

Modern Linux applications commonly use:

```text
/dev/urandom
```

for non-blocking random data.

---

# 113. Pipes

A pipe sends one command's standard output to another command's standard input.

Syntax:

```bash
command1 | command2
```

Example:

```bash
ls | grep ".txt"
```

---

# 114. Multiple Pipes

```bash
cat access.log | grep "404" | sort | uniq -c
```

Concept:

```text
cat
 ↓
grep
 ↓
sort
 ↓
uniq
```

---

# 115. Command Substitution

Execute a command and use its output:

```bash
echo "Today is $(date)"
```

Another form:

```bash
echo "Today is `date`"
```

The `$()` form is preferred because it nests cleanly.

---
