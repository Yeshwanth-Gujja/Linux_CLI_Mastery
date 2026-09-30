# Linux CLI — Editors and Shell Configuration

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 244. Text Editors

Common terminal editors:

```text
nano
vim
vi
emacs
```

---

# 245. Nano

Open:

```bash
nano notes.txt
```

Common shortcuts:

```text
Ctrl + O → save
Ctrl + X → exit
Ctrl + W → search
Ctrl + K → cut line
Ctrl + U → paste
```

---

# 246. Vim

Open:

```bash
vim notes.txt
```

Important modes:

```text
Normal mode
Insert mode
Command-line mode
```

Enter insert mode:

```text
i
```

Return to normal mode:

```text
Esc
```

Save and quit:

```text
:wq
```

Quit without saving:

```text
:q!
```

---

# 247. Vim Basic Navigation

Normal mode:

```text
h → left
j → down
k → up
l → right
```

Start of line:

```text
0
```

End of line:

```text
$
```

Beginning of file:

```text
gg
```

End of file:

```text
G
```

---

# 248. Vim Search

```text
/word
```

Next match:

```text
n
```

Previous match:

```text
N
```

---

# 249. Archive and Backup Mental Model

For a directory:

```text
Project
   ↓
tar
   ↓
archive
   ↓
gzip
   ↓
compressed archive
```

Example:

```bash
tar -czf project.tar.gz project/
```

---

# 250. Environment Configuration

Shell startup files depend on shell and login/interactive behavior.

For Bash, commonly encountered files include:

```text
~/.bashrc
~/.profile
~/.bash_profile
```

System-wide configuration may include:

```text
/etc/profile
/etc/bash.bashrc
```

Exact behavior varies by distribution and shell invocation mode.

---

# 251. `.bashrc`

Commonly used for interactive Bash shell configuration.

Example:

```bash
export EDITOR=nano
alias ll='ls -lah'
```

After editing, reload:

```bash
source ~/.bashrc
```

---

# 252. `source`

Execute a file in the current shell:

```bash
source ~/.bashrc
```

Equivalent Bash shorthand:

```bash
. ~/.bashrc
```

Important distinction:

```bash
./script.sh
```

usually runs the script in a new process/shell context.

```bash
source script.sh
```

runs it in the current shell environment.

---

# 253. Aliases

Create:

```bash
alias ll='ls -lah'
```

Then:

```bash
ll
```

View aliases:

```bash
alias
```

Remove:

```bash
unalias ll
```

Aliases are shell features, not standalone executable commands.

---

# 254. Functions

Bash functions:

```bash
greet() {
    echo "Hello $1"
}
```

Call:

```bash
greet Yeshwanth
```

---
