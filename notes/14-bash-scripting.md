# Linux CLI — Bash Scripting

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 255. Shell Scripts

A shell script is a text file containing shell commands.

Example:

```bash
#!/usr/bin/env bash

echo "Hello"
```

Save as:

```text
hello.sh
```

---

# 256. Shebang

The first line:

```bash
#!/usr/bin/env bash
```

is a shebang.

It tells the system which interpreter should be used when the script is executed as a program.

---

# 257. Executing a Script

Give execute permission:

```bash
chmod +x hello.sh
```

Run:

```bash
./hello.sh
```

Alternatively:

```bash
bash hello.sh
```

The latter explicitly invokes Bash and does not require the executable bit.

---

# 258. Script Variables

```bash
#!/usr/bin/env bash

name="Yeshwanth"

echo "Hello $name"
```

---

# 259. Positional Parameters

For:

```bash
./script.sh one two
```

Inside the script:

```text
$0 → script name
$1 → one
$2 → two
```

All arguments:

```bash
"$@"
```

Number of arguments:

```bash
$#
```

---

# 260. Exit from Script

```bash
exit 0
```

Success.

Error example:

```bash
exit 1
```

---

# 261. Conditional Statements

```bash
if [ "$name" = "Yeshwanth" ]; then
    echo "Hello"
else
    echo "Unknown"
fi
```

Modern Bash also supports:

```bash
if [[ "$name" == "Yeshwanth" ]]; then
    echo "Hello"
fi
```

---

# 262. File Tests

Examples:

```bash
[ -f file.txt ]
```

Regular file.

```bash
[ -d directory ]
```

Directory.

```bash
[ -e path ]
```

Exists.

```bash
[ -r file.txt ]
```

Readable.

```bash
[ -w file.txt ]
```

Writable.

```bash
[ -x file.sh ]
```

Executable.

---

# 263. Loops

## `for`

```bash
for file in *.txt; do
    echo "$file"
done
```

## `while`

```bash
while condition; do
    ...
done
```

## `until`

```bash
until condition; do
    ...
done
```

---

# 264. Command-Line Safety

Always quote variables containing paths or user input:

```bash
rm -- "$file"
```

rather than:

```bash
rm $file
```

Quoting prevents unwanted word splitting and glob expansion in many contexts.

---

# 265. `--`

A standalone:

```text
--
```

often tells a command that subsequent arguments should be treated as operands rather than options.

Example:

```bash
rm -- -important.txt
```

This can remove a filename beginning with `-`.

---

# 266. `xargs`

Build command arguments from standard input.

Example:

```bash
printf '%s\n' a b c | xargs echo
```

Be careful when filenames contain spaces, quotes, or newlines.

For safe filename handling with `find`, a common pattern is:

```bash
find . -type f -print0 | xargs -0 command
```

---

# 267. `sed`

Stream editor.

Simple substitution:

```bash
sed 's/old/new/' file.txt
```

Global replacement on each line:

```bash
sed 's/old/new/g' file.txt
```

Print selected lines:

```bash
sed -n '1,10p' file.txt
```

---

# 268. `awk`

Powerful text-processing language.

Example:

```bash
awk '{print $1}' file.txt
```

Prints the first whitespace-separated field.

Example:

```bash
awk -F: '{print $1}' /etc/passwd
```

Uses `:` as the field separator.

---
