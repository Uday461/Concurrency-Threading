#  What is Concurrency ??

Concurrency is the execution of multiple instruction sequences at the same time. Let's say we have 'Task1' and 'Task2' the 
execution flow of it will be as follows.
Task1 --> Task2 --> Task1 --> Task2............and so on.


# What is Parallelism ??

It is the use of multiple processing elements simultaneously for solving any problem. Problems are broken down into instructions
and are solved concurrently as each resource that has been applied to work is working at the same time.Let's say we have 'Task1' 
and 'Task2' the execution flow of it will be as follows.

Task1 --> Task1 --> Task1 --> Task1 ..........
Task2 --> Task2 --> Task2 --> Task2 ..........

If you see above in Parallelism multiple resources are involved for executing the tasks simultaneously unlike to Concurrency (where 
tasks appear to be executing simultaneous but actually not).

So Parallelism will give us most speed in execution but it will involve more resources unlike Concurrency. And it is not good to 
create more resources we need to go towards achieving Concurrency for execution of our tasks.


# How Concurrency is Achieved ?? 

By Time Slicing And Context Switching


# Problems with Concurrency ??
 
The main problem with Concurrency is Data Inconsistency. The below are some of them which falls under Data Inconsistency Problem.
 - Dirty Read Problem           
 - Unrepeatable Read Problem
 - Lost Update Problem
 - Phantom Read Problem 


# Concurrency in iOS

- Achieving multithreading by creating threads manually
- Grand Central Dispatch
- Operation Queues
- Modern Concurrency in Swift


## Manual Thread Creation

Pros: 
It is very raw of handling resources and gives the developer more control/customisation like to start, cancel, delay the tasks.
Cons:
- Responsibility to manage threads with system conditions comes on to developer.
- Deallocation once they are finished executing tasks. If we don't deallocate resources properly then there will be memory leak issues coming up.
- Auto release pool will not manage threads created by us.
- Maintaining the order of execution.


## Grand Central Dispatch (GCD)

- GCD is a queue based API that allows to execute closures on workers pools in the FIFO order.
- Unlike creating manual thread and controlling their deallocation and all, GCD takes complete responsibility on which thread to execute the submitted tasks to it but not the developer.

### What is Dispatch Queue ??

- It is the abstraction layer on top of queue.
- GCD manages a collection of dispatch queues. The work submitted to these dispatch queues is executed on pool of threads.
- A Dispatch Queue executes tasks either 'serially' or 'concurrently' but always in FIFO order (meaning - the tasks submitted to it are in FIFO order and they are also dequed in FIFO order).
- An application submit the task to Dispatch Queue in the form of blocks either synchronously or asynchronously.
 - Synchronous vs Asynchronous
  --> Synchronous: Block the execution (current thread) till the task submitted to Dispatch Queue is completed.
  --> Asynchronous: Continue the execution (of current thread) while the new task submitted to Dispatch Queue will execute asynchronously.

- Serial vs Concurrent Queue.
 - Serial: One task at a time.
 - Concurrent: Multiple tasks at a time.
 - In both the above scenarios the task submitted to Dispatch Queue will be dequeued serially that is in FIFO order only.

##### Serial/Concurrent affects the destination queue to which you are dispatching.
##### Sync/Async affects the current thread from which you are dispatching.


