# Linux CLI — Processes, Jobs and Signals

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 167. Processes

A process is a running instance of a program.

Every process has a PID.

---

# 168. `ps`

Display processes:

```bash
ps
```

---

# 169. `ps aux`

Common process listing:

```bash
ps aux
```

---

# 170. `ps -ef`

Another common format:

```bash
ps -ef
```

---

# 171. Process Fields

Common fields:

```text
PID
PPID
USER
CPU
MEM
TTY
STAT
START
TIME
COMMAND
```

---

# 172. PID

**PID** = Process ID.

Each running process has a process identifier.

---

# 173. PPID

**PPID** = Parent Process ID.

Processes can form parent-child relationships.

---

# 174. `pstree`

Display processes as a tree:

```bash
pstree
```

---

# 175. `top`

Real-time process monitor:

```bash
top
```

Exit:

```text
q
```

---

# 176. `htop`

A more interactive process viewer:

```bash
htop
```

It may need to be installed separately.

---

# 177. Killing Processes

```bash
kill PID
```

By default, `kill` sends:

```text
SIGTERM
```

This requests graceful termination.

---

# 178. `kill -9`

```bash
kill -9 PID
```

Sends:

```text
SIGKILL
```

SIGKILL cannot be caught or handled by the target process.

Use it as a last resort.

---

# 179. Common Signals

```text
SIGTERM → 15 → graceful termination request
SIGKILL → 9  → forceful termination
SIGHUP  → 1  → hangup/reload behavior depending on program
SIGINT  → 2  → interrupt
SIGSTOP → 19 → stop process
SIGCONT → 18 → continue stopped process
```

---

# 180. `pkill`

Kill processes by name/pattern:

```bash
pkill firefox
```

Use carefully.

---

# 181. `pgrep`

Find process IDs by name:

```bash
pgrep firefox
```

---

# 182. Foreground and Background

Run normally:

```bash
command
```

The shell waits for it.

Run in background:

```bash
command &
```

---

# 183. `jobs`

Show jobs belonging to the current shell:

```bash
jobs
```

---

# 184. `Ctrl + Z`

Suspends the foreground process.

It normally sends:

```text
SIGTSTP
```

---

# 185. `fg`

Bring a job to the foreground:

```bash
fg
```

Specific job:

```bash
fg %1
```

---

# 186. `bg`

Continue a stopped job in the background:

```bash
bg
```

---

# 187. `nohup`

Run a command so it can continue after the terminal/session disconnects in common cases:

```bash
nohup ./script.sh &
```

---

# 188. Sessions and Job Control

A shell manages jobs.

Conceptually:

```text
Shell
├── foreground job
├── background job
└── stopped job
```

Job IDs use:

```text
%1
%2
```

while process IDs use:

```text
1234
5678
```

Do not confuse them.

---

# 189. Process Priority

Linux processes have a scheduling priority relationship represented by **nice** values.

Start with a specific nice value:

```bash
nice -n 10 command
```

Change an existing process:

```bash
renice 10 -p PID
```

Lower nice values generally mean higher scheduling priority, while higher nice values mean the process is more willing to yield CPU time.

Changing priority toward higher privilege may require elevated permissions.

---
