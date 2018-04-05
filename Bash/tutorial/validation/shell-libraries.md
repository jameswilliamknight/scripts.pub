# Shell Libraries

There are two ways to call a script

- Running directly, spawns a new process, loses any scope except vars we `export`
- Sourcing using `. scriptname` or `source scriptname` which executes the script inline with the calling script, keeping the same scope.

_Why use a token...?_

- Secure in knowledge that this guide has been followed
- Validation that the script has been sourced
- The "include" is easy, a single-liner will load the library.
    - Using a single-line to invoke the script is easy, so is setting a token variable in that same line.

_Why not just make super sure we source each library script...?_

You could, but you lose advantages:

- Single-liner can be extended
- Token never has to change and is easy to find all usages
- The process of including this token encourages adding consistently formatted docs
- **TODO**: code generation automated with a `nlibrary` ("new library") style script
    - reuse of `nscript` ("new script") PATH script

## Steps

It is recommended you use the Atom editor, and install **Uuidgen** package.

```sh
apm install uuidgen
```

Grab a token via `Ctrl + Shift + p` > select **"Uuidgen: Generate"**

Example:

> 532862ab-a87d-4496-8921-f6e9859797480a76dd7c-44fc-4fdd-9baa-7944492ca3fc

It might pay to search your repositories for **the token you end up choosing** (the shorter the UUID, the more likely it might be duplicated). Use as much of the UUID as you feel comfortable for uniqueness. Remember that it will be included in a single-liner example to call the script.


### 1. Script Header

Includes

- Shebang
- Single Liner
- Set message variable for help.
    - Good to keep near single-liner for discoverability.

```sh
#!/usr/bin/env bash
#
#sourcetoken="532862abs" ; source logger.sh ; # paste into script & uncomment
callhelp="$0 must be called using the single-line command contained within."
```

### 2. Docs

```sh
#   Summary
#       This is a summary
#
#   Usage
#       Add the single line (see the top of this script) to enable.
#       This script must be on the PATH variable if called directly.
#
#   Development
#       TODO: one feature we would like to include
#       TODO: another feature we would like to include
#
#   ---------------------------------------------------------------------80char\
```

### 3. Script body

Put this shortly after header documentation

```sh
# This token being set in the calling script will be enough proof the script was
#     sourced properly and so shares the same variable scope. Defensive bashing.
if [ "${sourcetoken}" != "532862ab" ]; then
    # the script was not sourced correctly
    echo "${callhelp}"
    exit 1;
fi
```
