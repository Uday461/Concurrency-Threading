# Operations And Operation Queue

## GCD vs Operation Queue
- Operation Queue is built on top of GCD. It is more like a wrapper on GCD.
- GCD provides less control on task execution states, it is like fire and forget. If we wish to have more control over tasks execution then Operation Queue is preferred.

## Operation
- An abstract class that represents the code and data associated with single task.
- Swift doesn't support abstract classes but considering Operation to be abstract class and we cannot instantiate objects of abstract class (Operation), we need the implementation in the form of subclasses for which we have "Block Operation" and "NSInvocation Operation" (supported in Obj-C), "Custom Operation".
- Operation execution are synchronous by default that's why we usually dispatch Operations to Operation Queue unblocking main thread.
- We can also pass multiple blocks to a block operation and all of them are executed concurrently.

### States of the Operation.

- open var isReady: Bool { get }
- open var isExecuting: Bool { get }
- open var isCancelled: Bool { get }
- open var isFinished: Bool { get }

