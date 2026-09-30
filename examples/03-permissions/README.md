# Permissions Practice

```bash
printf '#!/usr/bin/env bash\necho hello\n' > hello.sh
ls -l hello.sh
chmod u+x hello.sh
./hello.sh
chmod 644 hello.sh
```

Do not experiment with ownership or recursive permissions on system directories.
