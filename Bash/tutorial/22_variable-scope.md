# Variable Scope

https://www.shellscript.sh/variables1.html

## New Environment

We spawn a new shell when we **directly** run a script:

```sh
#!/bin/sh
youcannot="read this variable inside myscript.sh"
./myscript.sh
```

so any variables set before that will need to be exported.

```sh
#!/bin/sh
exportedvar="export this variable to read it inside myscript.sh"
export exportedvar # like this
./myscript.sh # can see 'exportedvar'
# if myscript.sh changed 'exportedvar', those changes will be lost out here.
```

- `export` provides new shell instances with a variable **copy**.
- When the newly spawned shell exits, the environment, including the exported variables, are destroyed.
- the **shebang** is partly to blame for running a new shell

## Same Environment

'`source`' (alias '`.`') runs a script within the current environment; we can read and write variables across script files. This is called **"sourcing"** a script.

**myvar2.sh**:
```sh
#!/bin/sh
echo "MYVAR is: $MYVAR"  # MYVAR=hello (from example)
MYVAR="hi there"
echo "MYVAR is: $MYVAR"
```

**example usage**:

```sh
$ MYVAR=hello
$ echo $MYVAR
hello
$ . ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
$ echo $MYVAR
hi there
```

## Take Away

Using "exported" variables and not "sourcing" provides better encapsulation, so when we run scripts they only see the variables we want, and none that we don't.
