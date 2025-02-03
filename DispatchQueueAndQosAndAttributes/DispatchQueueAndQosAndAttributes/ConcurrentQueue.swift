//
//  ConcurrentQueue.swift
//  DispatchQueueAndQosAndAttributes
//
//  Created by Banavath UdayKiran Naik on 19/07/24.
//

import Foundation


class ConcurrentQueue {
    // MARK: - SerialQueues Examples
    let concurrentQueue = DispatchQueue(label: "com.Dispatch.ConcurrentQueue", attributes: .concurrent)
     
     func doConcurrentQueueAsync() {
         concurrentQueue.async {
             for i in 1...3 {
                 if(Thread.isMainThread) {
                     print("Task Running on Main Thread.")
                 } else {
                     print("Task Running On Other Thread.")
                 }
                 print("Task A execution is completed. \(i) ✅")
             }
         }
         
         concurrentQueue.async {
             for i in 1...3 {
                 print("Task B executiion is completed. \(i) 🅾️")
             }
         }
         print("Concurrent Queue Fuction exited.")
     }
    
    func doConcurrentQueueSync() {
        concurrentQueue.sync {
            for i in 1...3 {
                if(Thread.isMainThread) {
                    print("Task Running on Main Thread.")
                } else {
                    print("Task Running On Other Thread.")
                }
                print("Task A execution is completed. \(i) ✅")
            }
        }
        
        concurrentQueue.async {
            for i in 1...3 {
                print("Task B executiion is completed. \(i) 🅾️")
            }
        }
        print("Concurrent Queue Fuction exited.")
    }
}
