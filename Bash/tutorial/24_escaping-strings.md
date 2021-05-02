# Escaping

`"`, `$`, ```, and `\` are still interpreted by the shell, even when they're in double quotes.

The backslash (`\`) character is used to mark these special characters so that they are not interpreted by the shell, but passed on to the command being run

------------------------------

**Input** `"this is a double \" quote"`

**Output** `this is a double " quote`

------------------------------

**Input** `"this is a dollar \$ sign"`

**Output** `this is a dollar $ sign`

------------------------------

**Input**
```
"this is a back \` tick"
```
**Output**
```
this is a back ` tick
```

------------------------------

**Input** `"this is a back \\ slash"`

**Output** `this is a back \ slash`
