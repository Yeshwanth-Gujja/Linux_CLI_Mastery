# Services and Logs Practice

On a systemd-based Linux system:

```bash
systemctl --type=service --state=running
journalctl -b -p warning
```

Use an installed, non-critical service for further experiments.
