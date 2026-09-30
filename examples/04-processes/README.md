# Process Practice

```bash
sleep 300 &
jobs
pgrep -a sleep
ps -o pid,ppid,stat,cmd -p $(pgrep -n sleep)
kill -TERM $(pgrep -n sleep)
```
