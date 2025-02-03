#  DispatchWorkItemFlags

- A set of behaviours for a workItem.
- It is quality of service class, whether to create a barrier or spawn a new detached thread.
- The dispatch work item flags:
  ## assignCurrentContext
  ## detached
  ## enforceQoS
  ## inheritQoS
  ## noQoS
  ## barrier
  ---- Out of all the above flags, 'barrier' is most commonly used, others are very rarely used. So here we will learn about it.
  
- Barrier: Cause the workItem to act as a barrier block when submitted to a Concurrent Queue.


# Dispatch Semaphores

- Critical Section: Part of a program which tries to access shared resources.
     - When critical section is accessed by multiple threads at the same time, there are strong chances of data inconsistency.

- In Dispatch Semaphores the threads in 'Threads Queue' are allowed to access when counter value is non-negative. On calling '.wait()' method on Dispatch Semaphore object the counter value is reduced by 1 and when '.signal()' method is called the counter value is increased by 1. 

