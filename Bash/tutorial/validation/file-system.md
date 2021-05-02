# File System

## File Exists

```sh
#!/bin/bash

if [ -f "${HOME}/.bashrc" ];
then
    echo "the file exists"
else
    echo "does not exist"
fi
```

## Directory Exists


```sh
testdir="${HOME}/src"
if [ ! -d "${testdir}" ]; then
  mkdir "${testdir}"
fi
```
