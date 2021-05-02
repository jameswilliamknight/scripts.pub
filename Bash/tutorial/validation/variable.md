# Checking a variable is set

## Recommended

```sh
if [ -z ${var+x} ]; then
  echo "var is not set."
else
  echo "var is set to $var"
fi
```

## Alternative

```sh
if [[ ! $1 ]]; then
    echo "Missing argument"
    exit 1
fi
```
