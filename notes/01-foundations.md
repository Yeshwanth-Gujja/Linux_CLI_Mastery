# Linux CLI — Foundations

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 1. Linux CLI Fundamentals

## 1.1 What is Linux?

Linux is an open-source Unix-like operating system kernel.

A complete Linux operating system is typically built from:

```text
Linux Kernel
    +
System Libraries
    +
System Utilities
    +
Shell
    +
Applications
```

Examples of Linux distributions:

```text
Ubuntu
Debian
Fedora
Arch Linux
Linux Mint
RHEL
Rocky Linux
AlmaLinux
openSUSE
```

---

# 2. What is CLI?

**CLI** stands for **Command-Line Interface**.

It allows users to interact with an operating system by entering commands into a terminal.

Example:

```bash
ls
```

Instead of clicking a file manager, you can use:

```bash
cd Documents
ls
```

---

# 3. Terminal vs Shell

These are not the same thing.

## Terminal

A **terminal** is an interface through which you interact with a shell.

Examples:

```text
GNOME Terminal
Konsole
Windows Terminal
Alacritty
```

## Shell

A **shell** is a program that interprets commands and executes them.

Common shells:

```text
bash
zsh
fish
sh
ksh
```

Most Linux beginners encounter **Bash** first.

---

# 4. Bash

**Bash** stands for:

```text
Bourne Again SHell
```

It is one of the most widely used Unix/Linux shells.

Check your current shell:

```bash
echo "$SHELL"
```

Check the current shell process:

```bash
ps -p $$ -o comm=
```

---

# 5. Command Prompt

A typical prompt might look like:

```text
yeshwanth@ubuntu:~$
```

Breakdown:

```text
yeshwanth  → username
@          → separator
ubuntu     → hostname
:          → separator
~          → current directory
$          → normal user prompt
```

A root prompt commonly ends with:

```text
#
```

Example:

```text
root@ubuntu:/#
```

Do not assume `$` or `#` is part of the command.

If the prompt shows:

```text
$ ls
```

you type:

```bash
ls
```

---

# 6. Root User

The **root user** is the superuser.

Root has extensive privileges over the system.

Example:

```bash
whoami
```

Normal user:

```text
yeshwanth
```

Root:

```text
root
```

Avoid using root unnecessarily.

---

# 7. `sudo`

`sudo` allows an authorized user to execute a command with elevated privileges.

Example:

```bash
sudo apt update
```

Another example:

```bash
sudo systemctl restart nginx
```

Check whether your account can use sudo:

```bash
sudo -l
```

---

# 8. Basic Command Structure

A command commonly follows:

```text
command [options] [arguments]
```

Example:

```bash
ls -lah /home
```

Breakdown:

```text
ls      → command
-lah    → options
/home   → argument
```

---

# 9. Options

Options modify command behavior.

Example:

```bash
ls
```

versus:

```bash
ls -l
```

Long-form options often use:

```bash
ls --all
```

Short options commonly use:

```bash
-a
```

Multiple short options can often be combined:

```bash
ls -lah
```

---

# 10. Arguments

Arguments tell the command what to operate on.

Example:

```bash
cat notes.txt
```

Here:

```text
cat       → command
notes.txt → argument
```

Another example:

```bash
rm file.txt
```

---

# 11. Command History

View previous commands:

```bash
history
```

Run the previous command:

```bash
!!
```

Run command number 25:

```bash
!25
```

Run the most recent command beginning with `git`:

```bash
!git
```

---

# 12. Command History Navigation

Press:

```text
↑
```

to move backward through previous commands.

Press:

```text
↓
```

to move forward.

Useful shortcuts:

```text
Ctrl + P → previous command
Ctrl + N → next command
```

---

# 13. Clearing the Terminal

```bash
clear
```

Keyboard shortcut:

```text
Ctrl + L
```

---

# 14. Exiting the Shell

```bash
exit
```

or:

```text
Ctrl + D
```

---

# 15. Getting Help

Linux provides extensive command documentation.

## `man`

```bash
man ls
```

Displays the manual page for `ls`.

Example:

```bash
man chmod
```

---

# 16. `--help`

Many commands support:

```bash
ls --help
```

This provides a shorter usage reference.

---

# 17. `info`

Some GNU utilities provide detailed documentation through:

```bash
info coreutils
```

---

# 18. `whatis`

Provides a short description.

```bash
whatis ls
```

---

# 19. `apropos`

Searches manual-page descriptions.

```bash
apropos password
```

Useful when you know what you want to accomplish but don't know the command.

---

# 20. Finding Command Location

## `which`

```bash
which python
```

Shows the executable found through the current `PATH`.

## `type`

```bash
type ls
```

This is often more informative.

Example:

```bash
type cd
```

may reveal that `cd` is a shell builtin.

---

# 21. `whereis`

```bash
whereis python
```

Searches for binary, source, and manual locations associated with a command.

---
