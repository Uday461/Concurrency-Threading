//
//  ViewController.swift
//  DispatchQueueAndQosAndAttributes
//
//  Created by Banavath UdayKiran Naik on 14/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        //  methodToCheckTasksDispatchedToMainAndGlobalQueueRunningThread()
        
       //  qualityOfService()
        
       // targetQueues()
       
       let serialQueueObj = SerialQueue()
        
       // serialQueueObj.doSerialQueueAsync()
        
       // serialQueueObj.doSerialQueueSync()
        
       let concurrentQueueObj = ConcurrentQueue()
        
        concurrentQueueObj.doConcurrentQueueAsync()
        
       // concurrentQueueObj.doConcurrentQueueSync()
    }

    func methodToCheckTasksDispatchedToMainAndGlobalQueueRunningThread() {
        DispatchQueue.main.async {
            print(Thread.isMainThread ? "Main Queue tasks is Run on Main Thread" : "Main Queue tasks is Run on BackGround Thread")
        }
        
        DispatchQueue.global().async {
            print(Thread.isMainThread ? "Global Queue tasks is Run on Main Thread" : "Global Queue tasks is Run Background Thread")
        }
    }
    
    func qualityOfService() {
        DispatchQueue.global(qos: .background).async {
            for i in 0...10 {
                print(i)
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            for i in 11...21 {
                print(i)
            }
        }
        
        // Since the complexities of both the above tasks are same, if we compare, then the task dispatched to Global Queue with
        // 'UserInteractive' QoS will complete its execution first before the task dispatched to Global Queue with 'Background' Qos as it will get more resource because of its high priority.
    }
    
    func targetQueues() {
        let a = DispatchQueue(label: "A")
        
        // This won't be concurrent Queue anymore as it inherits its Target Queue 'a' and will be serial Queue.
        let b = DispatchQueue(label: "B", attributes: .concurrent, target: a)
        
        
        a.async {
            for i in 0...5 {
                print(i)
            }
        }
        
        a.async {
            for i in 6...10 {
                print(i)
            }
        }
        
        b.async {
            for i in 11...15 {
                print(i)
            }
        }
        
        b.async {
            for i in 16...20 {
                print(i)
            }
        }
    }
}

