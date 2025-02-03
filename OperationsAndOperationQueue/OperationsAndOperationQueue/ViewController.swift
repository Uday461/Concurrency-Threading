//
//  ViewController.swift
//  OperationsAndOperationQueue
//
//  Created by Banavath UdayKiran Naik on 15/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //                print("Task Execution started")
        //                testOperations()
        //                print("Task Execution completed")
        //
        //                multipleBlockOperationsTest()
        //                print("Task execution completed.")
        
        //        multipleBlockOperationsTestOffMainThread()
        //        print("Task execution completed.")
        
        //          testCustomOperation()
        
        //        testOperationAndOperationQueue()
        //        print("Executions STARTED....")
        
        testOperationsDispatchedAsynchronously()
    }
    
    func testOperations() {
        let operation: BlockOperation = BlockOperation {
            print("Task executing.....")
            sleep(3)
        }
        operation.start()
    }
    
    //Multiple execution blocks added to a block operations are executed concurrently.
    
    func multipleBlockOperationsTest() {
        let operation: BlockOperation = BlockOperation ()
        operation.addExecutionBlock {
            print("First Block Executed")
        }
        
        operation.addExecutionBlock {
            print("Second Block Executed")
        }
        
        operation.addExecutionBlock {
            print("Third Block Executed")
        }
        
        operation.start()
    }
    
    func multipleBlockOperationsTestOffMainThread() {
        let operation: BlockOperation = BlockOperation ()
        
        //Callback once the Operation Tasks are completed.
        operation.completionBlock = {
            print("Execution Completed.....!!!!!!!")
        }
        
        operation.addExecutionBlock {
            print("First Block Executed")
        }
        
        operation.addExecutionBlock {
            print("Second Block Executed")
        }
        
        operation.addExecutionBlock {
            print("Third Block Executed")
        }
        
        DispatchQueue.global().async {
            operation.start()
            print("Did Operation run on Main Thread: \(Thread.isMainThread)")
        }
    }
    
    func testCustomOperation() {
        let operation: CustomOperation = CustomOperation()
        
        operation.start() // First start() is called and then main() is called.
        
        print("Custom Operation Execution Done.!!")
    }
    
    // Operations And Operation Queue
    // Operations added to OperationQueue are executed concurrently.
    
    func testOperationAndOperationQueue() {
        let operationQueue: OperationQueue = OperationQueue()
       // operationQueue.maxConcurrentOperationCount = 1 // This sets the number of operations that we want to execute concurrently.
        
        
        let operation1: BlockOperation = BlockOperation()
        
        operation1.completionBlock = {
            print("Operation1 Execution Completed.")
        }
        
        operation1.addExecutionBlock {
            for i in 0...10 {
                print(i)
            }
        }
        
        let operation2: BlockOperation = BlockOperation()
        
        operation2.completionBlock = {
            print("Operation2 Execution Completed.")
        }
        
        operation2.addExecutionBlock {
            for i in 11...20 {
                print(i)
            }
        }
        
        // Adding Operation1 as Dependency on Operation2
        operation2.addDependency(operation1) // This says, operation2 gets executed only when operation1 completes its execution. There might be delay in execution of completion block of operation1, but it is for sure that the task in operation2 execution block will only get executed after completion of task in operation1. (Completion Block of operation1 might get executed with slight delay, but before that tasks of operation2 might get started.)
        
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
    
    
    // Dispatching Operations to DispatchQueue and then Dispatching to OperationQueue.
    
    func testOperationsDispatchedAsynchronously() {
        let operationQueue: OperationQueue = OperationQueue()
        
//        let operation1: BlockOperation = BlockOperation(block: printOneToTen)
//        let operation2: BlockOperation = BlockOperation(block: printElevenToTwenty)
        
        
        let operation1: PrintNumbersOperation = PrintNumbersOperation(range: Range(0...25))
        let operation2:  PrintNumbersOperation = PrintNumbersOperation(range: Range(26...50))
        
        operation2.addDependency(operation1) // Operation2 will execute once the Operation1 execution completes. But the expected output won't be that because we are dispatching the tasks asynchronously to DispatchQueue due to which once the 'printOneToTen()' function ends, operation2 starts i.e., 'printElevenToTwenty()' task starts due to which the order of execution won't be expected i.e., first 1 to 10 gets printed after which only 11 to 20 gets printed. To achieve the expected behaviour we are using AsyncOperation (Custom Operation class) implementation.
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        print("Operations Execution")
    }
    
    func printOneToTen() {
        DispatchQueue.global().async {
            for i in 0...10 {
                print(i)
            }
        }
    }
    
    func printElevenToTwenty() {
        DispatchQueue.global().async {
            for i in 11...20 {
                print(i)
            }
        }
    }
}



class CustomOperation: BlockOperation {
    
    // Execution took off the main thread.
    override func start() {
        Thread.init(block: main).start()
    }
    
    override func main() {
        for i in 0...10 {
            print(i)
        }
    }
}


class PrintNumbersOperation: AsyncOperation {
    var range: Range<Int>
    
    init(range: Range<Int>) {
        self.range = range
    }
    
    override func main() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            for i in self.range {
                print(i)
            }
            self.state = .isFinished
        }
    }
}
