# Labs for ECE 350, Real-Time Operating Systems
## Made in partnership with Max Long

---

## Lab 1: Context Switching
Allows for tasks to be scheduled by the operating system and to be interleaved between each other.  
A simple round-robin scheduler is used.  
On switch, current registers are pushed to the stack, a new task is selected, and new registers are popped.  

## Lab 2: Dynamic Memory Allocation
Implementation of malloc() and free() (like new and delete) using [binary buddy allocation](https://en.wikipedia.org/wiki/Buddy_memory_allocation).  
Allows for log(n) time complexity.  
Received a bonus for accommodating non-power-of-2 heap sizes.  

## Lab 3: EDF Scheduling
Earliest deadline first scheduling driven by a timer interrupt.  
All critical OS functions like sleep() and malloc() are protected via system calls to protect against race conditions.  

---

## Key OS API Functions

### Memory Allocation
void* k_mem_alloc(size_t size);  
int k_mem_dealloc(void* p_mem);  

### Task Scheduling
int osCreateTask(TCB* task);
int osCreateDeadlineTask(int deadline, TCB* task);
void osYield(void);
void osSleep(int timeInMs);
void osPeriodYield(void);
int osSetDeadline(int deadline, task_t TID);
