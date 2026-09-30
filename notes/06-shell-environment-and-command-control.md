# Linux CLI — Shell Environment and Command Control

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 116. Variables

Create a shell variable:

```bash
name="Yeshwanth"
```

Important:

```bash
name="Yeshwanth"
```

Correct.

```bash
name = "Yeshwanth"
```

Incorrect in shell syntax because spaces change the command structure.

---

# 117. Accessing Variables

```bash
echo "$name"
```

---

# 118. Environment Variables

Environment variables are exported to child processes.

```bash
export NAME="Yeshwanth"
```

Check:

```bash
echo "$NAME"
```

---

# 119. `env`

Display environment variables:

```bash
env
```

---

# 120. `printenv`

```bash
printenv
```

Specific variable:

```bash
printenv PATH
```

---

# 121. `PATH`

`PATH` tells the shell where to search for executable commands.

```bash
echo "$PATH"
```

Example:

```text
/usr/local/bin:/usr/bin:/bin
```

Directories are separated by:

```text
:
```

---

# 122. Why `./command`?

Suppose:

```bash
script.sh
```

is in the current directory.

Running:

```bash
script.sh
```

may fail because `.` may not be in `PATH`.

Use:

```bash
./script.sh
```

This explicitly refers to the current directory.

---

# 123. Quoting

## Double quotes

```bash
echo "Hello $name"
```

Variables are expanded.

## Single quotes

```bash
echo 'Hello $name'
```

The `$name` is treated literally.

---

# 124. Escaping

Use `\` to escape special interpretation.

Example:

```bash
echo "Price: \$100"
```

Output:

```text
Price: $100
```

---

# 125. Command Chaining

Run commands sequentially:

```bash
command1 ; command2
```

The second command runs regardless of whether the first succeeds.

---

# 126. `&&`

```bash
command1 && command2
```

The second command runs only if the first succeeds.

---

# 127. `||`

```bash
command1 || command2
```

The second command runs if the first fails.

---

# 128. Exit Status

Linux commands return an exit status.

Convention:

```text
0 → success
non-zero → failure/error
```

Check the previous command:

```bash
echo $?
```

Example:

```bash
true
echo $?
```

returns:

```text
0
```

---

# 129. `true` and `false`

```bash
true
```

returns success.

```bash
false
```

returns failure.

These are useful in shell scripting and testing.

---
