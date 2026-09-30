# Linux CLI Cheat Sheet

## Navigation
```bash
pwd
ls -la
cd /path
cd ..
cd ~
```

## Files
```bash
mkdir -p dir/subdir
touch file
cp source destination
cp -r dir destination
mv source destination
rm file
rm -r dir
file path
stat path
ln -s target link
```

## Search and text
```bash
find . -type f -name '*.log'
grep -Rni 'error' .
head -n 20 file
tail -n 20 file
tail -f file
sort file | uniq -c
cut -d: -f1 /etc/passwd
sed 's/old/new/g' file
awk '{print $1}' file
```

## Streams
```bash
command > out.txt
command >> out.txt
command 2> err.txt
command > out.txt 2>&1
command | grep pattern
command > /dev/null 2>&1
```

## Identity and permissions
```bash
whoami
id
groups
chmod 755 script.sh
chmod u+x script.sh
sudo chown user:group file
umask
```

## Processes
```bash
ps aux
top
pgrep name
pkill name
kill PID
kill -TERM PID
kill -KILL PID
jobs
fg %1
bg %1
```

## System and storage
```bash
uname -a
lscpu
free -h
df -h
du -sh directory
lsblk
findmnt
```

## Networking
```bash
ip addr
ip route
ping -c 4 host
ss -tuln
curl -I https://example.com
curl -v https://example.com
dig example.com
ssh user@host
scp file user@host:/path/
rsync -av source/ user@host:/path/
```

## Services and logs
```bash
systemctl status service
systemctl start service
systemctl enable --now service
journalctl -u service
journalctl -b
journalctl -f
```

## Packages
```bash
sudo apt update && sudo apt upgrade
sudo apt install package
sudo dnf install package
sudo pacman -S package
```

## Archives
```bash
tar -czf archive.tar.gz directory/
tar -xzf archive.tar.gz
zip -r archive.zip directory/
unzip archive.zip
```

## Bash
```bash
name=value
echo "$name"
export NAME=value
echo "$?"
echo "$#"
printf '%s\n' "$@"
command1 && command2
command1 || command2
$(command)
```