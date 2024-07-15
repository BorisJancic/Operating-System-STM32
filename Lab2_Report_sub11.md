# Lab 2 Grading Report

## Table of Contents
[[_TOC_]]

## test0
Compilation & compatibility with evaluation framework ~ calls osKernelInit, k_mem_init, and printf.

### expected output
```
---- test0 ----
PASS: build successful
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test1
Allocate function is able to find free space if it exists.

### expected output
```
---- test1 ----
k_mem_alloc 933 bytes, ptr=0x2000a7e8
k_mem_alloc 743 bytes, ptr=0x2000abe8
k_mem_alloc 262 bytes, ptr=0x2000afe8
k_mem_alloc 529 bytes, ptr=0x2000b3e8
k_mem_alloc 700 bytes, ptr=0x2000b7e8
Validating buffer contents... 
PASS: no corrupted buffers 
PASS: all k_mem_alloc calls successful 
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test2
Deallocation function makes a block available for allocation again.

### expected output
```
---- test2 ----
allocating 4 bytes...
allocating large block...
deallocating the first block...
PASS: k_mem_dealloc returned OK
allocating 4 bytes again... should fit into the first spot
PASS: freed memory was used again

<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test3
Deallocated blocks are coalesced together correctly, according to the buddy scheme.

### expected output
```
---- test3 ----
1 byte block allocated, ptr=0x2000b3d8
33 byte block allocated, ptr=0x2000b418
deallocating 0x2000b3d8
testing if 33 bytes can fit at 0x2000b3d8 
PASS: k_mem_dealloc coalesced with its buddy
257 byte block allocated, ptr=0x2000b5d8
deallocating 0x2000b418
testing if 257 bytes can fit at 0x2000b3d8 
PASS: k_mem_dealloc coalesced three iterations
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test4
Managed memory blocks are always powers of two in size, smallest block is 32B, which can fit a 4-byte allocation.

### expected output
```
---- test4 ----
1 byte block allocated, ptr=0x2000b478
4 byte block allocated, ptr=0x2000b498
PASS: smallest block is 32B
4 byte block allocated, ptr=0x2000b4b8
PASS: 4 bytes could fit into 32B block
k_mem_alloc 533 bytes, ptr=0x2000b878
k_mem_alloc 243 bytes, ptr=0x2000b678
k_mem_alloc 362 bytes, ptr=0x2000bc78
k_mem_alloc 329 bytes, ptr=0x2000be78
k_mem_alloc 300 bytes, ptr=0x2000c078
k_mem_alloc 708 bytes, ptr=0x2000c478
k_mem_alloc 52 bytes, ptr=0x2000b4f8
k_mem_alloc 156 bytes, ptr=0x2000b578
k_mem_alloc 656 bytes, ptr=0x2000c878
k_mem_alloc 19 bytes, ptr=0x2000c278
k_mem_alloc 711 bytes, ptr=0x2000cc78
k_mem_alloc 851 bytes, ptr=0x2000d078
k_mem_alloc 543 bytes, ptr=0x2000d478
k_mem_alloc 605 bytes, ptr=0x2000d878
k_mem_alloc 708 bytes, ptr=0x2000dc78
k_mem_alloc 293 bytes, ptr=0x2000e078
k_mem_alloc 30 bytes, ptr=0x2000c2b8
k_mem_alloc 66 bytes, ptr=0x2000c2f8
k_mem_alloc 569 bytes, ptr=0x2000e478
k_mem_alloc 332 bytes, ptr=0x2000e278
Validating block sizes...
PASS: all blocks could be power of 2
<serial timeout>
<end of test>

```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test5
32KB of heap memory are managed; bonus awarded if full heap size is managed

### expected output
```
---- test5 ----

allocating large block that fills up the heap...
PASS: largest block is 32744 bytes

checking if bonus was attempted...
found additional capacity of 0B
test completed
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test6
Deallocating a random pointer will return an error.

### expected output
```
---- test6 ----
allocating one block, then try to deallocate a pointer outside of this block...
PASS: k_mem_dealloc returned error (expected)
allocating large block...
deallocating a pointer part way in the large block
PASS: k_mem_dealloc returned error (expected)
try to deallocate a valid pointer twice...
PASS: k_mem_dealloc returned error on second call (expected)
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test7
Only the owner can free a block of memory (this will require using the kernel to run 2 tasks and calling allocate & deallocate from those tasks).

### expected output
```
allocating from first task
deallocating from first task
PASS: k_mem_dealloc successful
allocating again from first task
deallocating from second task
PASS: k_mem_dealloc returned error (expected)
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test8
The entire heap space should be back in one piece after deallocating everything (bonus version should be back to starting state, shown below)

### expected output
```
---- test8 ----
Maximum allocation accepted at the start = 32756 bytes
Found additional capacity of 2624B
Deallocating everything...

Commence random usage

itr=0, alloc 933 bytes, ptr=0x200135c4
itr=1, alloc 743 bytes, ptr=0x200139c4
itr=2, alloc 262 bytes, ptr=0x20013dc4
also dealloc mem from itr 1, ptr=0x200139c4, ~743 bytes
itr=3, alloc 700 bytes, ptr=0x200139c4
itr=4, alloc 508 bytes, ptr=0x2000b5c4
also dealloc mem from itr 0, ptr=0x200135c4, ~933 bytes
itr=5, alloc 256 bytes, ptr=0x2000b9c4
itr=6, alloc 256 bytes, ptr=0x2000bbc4
[...]
itr=47, alloc 352 bytes, ptr=0x2000f1c4
itr=48, alloc 665 bytes, ptr=0x2000cdc4
also dealloc mem from itr 47, ptr=0x2000f1c4, ~352 bytes
itr=49, alloc 738 bytes, ptr=0x200139c4
now deallocate everything...
dealloc mem from itr 7, ptr=0x2000bdc4, ~351 bytes
dealloc mem from itr 8, ptr=0x2000c1c4, ~843 bytes
[...]
dealloc mem from itr 46, ptr=0x20013fc4, ~7 bytes
dealloc mem from itr 48, ptr=0x2000cdc4, ~665 bytes
dealloc mem from itr 49, ptr=0x200139c4, ~738 bytes
retest capacity...

Maximum allocation accepted at the end = 32756 bytes
Found additional capacity of 2624B
PASS: heap space is same capacity as the start
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test9
Execution time over a series of allocations; excution time over a series of deallocations. (Thresholds are calculated as the midpoint between the compiler's implementation and linear search through all blocks.)

### expected output
```
---- test9 ----
Using DWT for timing

k_mem_alloc runtime=80901 [this is the threshold]
Time per iteration:
... 

k_mem_dealloc runtime=65369 [this is the threshold]
Time per iteration:
... 

<serial timeout>
<end of test>

```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## test10
Execution time performance over random usage: allocations with random sizes interspersed with deallocations with random (valid) addresses; bonus awarded if top 10% in class.

### expected output
```
---- test10 ----
Using DWT for timing

Total runtime=69459.5 [this is the threshold]
Time per iteration (^ denotes deallocations):
...

<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00

## Test 5 with build workaround
If your test 5 above did not build and this test builds, then this is your test 5 score. 
(It is normal if only one of test 5 or 11 manages to build). 

### expected output
```
---- test5 ----

allocating large block that fills up the heap...
PASS: largest block is 32744 bytes

checking if bonus was attempted...
found additional capacity of 0B
test completed
<serial timeout>
<end of test>
```
### your output
```
<build failed>

```
### your score: 0.00/1.00



