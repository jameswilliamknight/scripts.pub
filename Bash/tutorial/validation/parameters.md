# Validating Parameters

Expecting a **more than one** parameter:
```sh

if [[ $# > 1 ]]; then
	echo "Usage: $0 \"optionally enter some text\""
	exit 1
fi
```

There are not exactly **3** parameters:
```sh
if [ $# -ne 3 ]; then
	# show help
	exit 1;
fi
```
