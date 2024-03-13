# Fiba

Trying to learn Assembly language. Made a Fibonacci printer...

Fibonacci Sequence >> series of numbers where each number is the
sum of the two preceding numbers.

## What does it do?

Enter the maximum number to count up the Fibonaci seq to. 
The sequence will print..

## The files

* fiba.s	- The Assembly code
* fiba		- The Program

## How to do?

Just run the program fiba. 

**Or, if you wanna try to assemble the file:**
* nasm -f elf64 fiba.s  
*(for 64-bit)* 


Will output a object file, "fiba.o".
Link the object file with the command:
* ld fiba.o -o fiba -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2

To Debug with GDB:
* gdb -q fiba
  
  
  

fiba$ ./fiba  
How high to go? Enter the maximum Fibonaci number:55  
1
1
2
3
5
8
13
21
34
  
fiba$ ./fiba  
How high to go? Enter the maximum Fibonaci number:543  
1
1
2
3
5
8
13
21
34
55
89
144
233
377
  
fiba$ ./fiba   
How high to go? Enter the maximum Fibonaci number:99999999999  
1
1
2
3
5
8
13
21
34
55
89
144
233
377
610
987
1597
2584
4181
6765
10946
17711
28657
46368
75025
121393
196418
317811
514229
832040
1346269
2178309
3524578
5702887
9227465
14930352
24157817
39088169
63245986
102334155
165580141
267914296
433494437
701408733
1134903170

