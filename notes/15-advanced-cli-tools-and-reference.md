# Linux CLI — Advanced CLI Tools and Reference

> This section is part of **Linux CLI Mastery**. Source material from the supplied Linux CLI notes is preserved and organized by topic.

# 269. `diff`

Compare files:

```bash
diff file1.txt file2.txt
```

Useful for configuration and source-code comparison.

---

# 270. `cmp`

Byte-level comparison:

```bash
cmp file1 file2
```

---

# 271. `comm`

Compare sorted files:

```bash
comm file1.txt file2.txt
```

The inputs generally need to be sorted.

---

# 272. `basename`

Extract filename from path:

```bash
basename /home/user/file.txt
```

Result:

```text
file.txt
```

---

# 273. `dirname`

Extract directory portion:

```bash
dirname /home/user/file.txt
```

Result:

```text
/home/user
```

---

# 274. `realpath`

Resolve an absolute path:

```bash
realpath ./notes.txt
```

---

# 275. `readlink`

Inspect symbolic links:

```bash
readlink linkname
```

---

# 276. `date`

Display date/time:

```bash
date
```

Format:

```bash
date '+%Y-%m-%d %H:%M:%S'
```

---

# 277. `cal`

Display a calendar on systems where installed:

```bash
cal
```

---

# 278. `uptime`

Show how long the system has been running:

```bash
uptime
```

It also displays load information.

---

# 279. `whoami`

```bash
whoami
```

Answers:

```text
Which user am I currently operating as?
```

---

# 280. `hostname`

```bash
hostname
```

Answers:

```text
What is this machine called?
```

---

# 281. `id`

```bash
id
```

Answers:

```text
What are my UID, GID, and groups?
```

---

# 282. `pwd`

```bash
pwd
```

Answers:

```text
Where am I?
```

---

# 283. `ls`

```bash
ls
```

Answers:

```text
What is here?
```

---

# 284. `cd`

```bash
cd directory
```

Answers:

```text
Move me somewhere else.
```

---

# 285. `cp`

```bash
cp source destination
```

Answers:

```text
Copy this.
```

---

# 286. `mv`

```bash
mv source destination
```

Answers:

```text
Move/rename this.
```

---

# 287. `rm`

```bash
rm file
```

Answers:

```text
Remove this.
```

---

# 288. `mkdir`

```bash
mkdir directory
```

Answers:

```text
Create this directory.
```

---

# 289. `touch`

```bash
touch file
```

Answers:

```text
Create this file if absent / update its timestamps.
```

---

# 290. `cat`

```bash
cat file
```

Answers:

```text
Show this file.
```

---

# 291. `grep`

```bash
grep pattern file
```

Answers:

```text
Find matching text.
```

---

# 292. `find`

```bash
find path ...
```

Answers:

```text
Find filesystem objects according to conditions.
```

---

# 293. `ps`

```bash
ps
```

Answers:

```text
What processes are running?
```

---

# 294. `kill`

```bash
kill PID
```

Answers:

```text
Send a signal to this process.
```

---

# 295. `df`

```bash
df -h
```

Answers:

```text
How much filesystem space is available?
```

---

# 296. `du`

```bash
du -sh directory
```

Answers:

```text
How much space is this directory using?
```

---

# 297. `free`

```bash
free -h
```

Answers:

```text
How much memory is available?
```

---

# 298. `ip`

```bash
ip addr
```

Answers:

```text
What network interfaces and addresses exist?
```

---

# 299. `ss`

```bash
ss -tuln
```

Answers:

```text
What sockets are listening?
```

---

# 300. `systemctl`

```bash
systemctl status service
```

Answers:

```text
What is the state of this systemd service?
```

---
