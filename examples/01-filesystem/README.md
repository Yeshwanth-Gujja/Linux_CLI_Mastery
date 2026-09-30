# Filesystem Practice

Run in a disposable directory:

```bash
mkdir -p linux-cli-lab/{docs,logs,archive}
cd linux-cli-lab
printf '%s\n' one two three > docs/items.txt
cp docs/items.txt docs/copy.txt
mv docs/copy.txt archive/copy.txt
find . -type f -print
```

Clean up with `cd .. && rm -rf -- linux-cli-lab` only when you have verified the path.
