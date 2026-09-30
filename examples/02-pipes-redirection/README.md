# Pipes and Redirection Practice

```bash
printf '%s\n' error info error warning | sort | uniq -c
printf '%s\n' alpha beta gamma > output.txt
grep error output.txt > errors.txt 2> /tmp/example-errors.txt
```

Focus on which stream each operator affects.
