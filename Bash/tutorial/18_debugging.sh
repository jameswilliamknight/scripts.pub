#!/bin/sh

set -x

test="test"
echo "this is a $test"

set +x

echo "debugging is now turned off"
echo "you can also add -x to the shebang like so"
echo "#!/bin/sh -x"
