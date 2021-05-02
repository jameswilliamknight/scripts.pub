# Loops

source: https://www.shellscript.sh/loops.html

## `for`

```sh
#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done
```

```sh
#!/bin/sh
for i in hello 1 * 2 goodbye
do
  echo "Looping ... i is set to $i"
  #Looping ... i is set to hello
  #Looping ... i is set to 1
  ##
  ##wildcard... runs the loop for each file in current dir
  #Looping ... i is set to file1.txt  
  #Looping ... i is set to file2.pdf
  #Looping ... i is set to file3.etc
  ##etc.....
  ##
  #Looping ... i is set to 2
  #Looping ... i is set to goodbye
done
```

## `while`
s
