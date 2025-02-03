# DispatchGroup

- Multiple tasks can be grouped together for execution.
- We can wait for the tasks to be finished or can continue with some other task and can get notified when tasks in the group complete their execution.
- Dispatch Group is something which we can use to execute multiple tasks and get call back when they are completed. This will help in scenarios where we have a situation where we want to execute multiple tasks in disptach Queue after their completion only we want to execute any other task.
- Dispatch Group has four methods - .enter(), .leave(), .wait(), .notify()

  - .enter() -- When we want to disptach a block of code to DispatchGroup use this method.
  
  - .leave() -- We need to call this method when the block of code disptached to DispatchGroup completes its execution.
  
  - .notify() -- When all the the tasks dispatched to Dispatch Group with '.enter' method are counter balanced by '.leave()' method, the '.notify()' method gets automatically invoked and in this escaping handler we can dispatch the piece of code we want to execute after all the block of codes dispatched to DispatchGroup completed their execution.
  
  - .wait() -- This is basically used when we want to stop the exection happening on the current thread and proceed only after all the tasks dispatched to DispatchGroup completes their execution. Since it stops the tasks happening on current thread, it should never be called upon 'main thread' as it hampers user experience.
  
  
# Dispatch WorkItem

- Encapsulates a block of code.
- Can be dispatched to both DispatchQueue and DispatchGroup.
- Provides the flexibility to cancel the task in between (unless execution has started).

- Dispatch WorkItem - .cancel(), .wait(), .notify()
 
 - .cancel() -- If it is set to 'true' before execution, task won't execute.
             -- If workItem is set to 'true' during execution, [.cancel()] will return 'true' but it won't abort the execution. It is developers responsibility to do.

- .wait() && .notify() -- works the same way as in DispatchGroup.
