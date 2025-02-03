//
//  SerialQueue.swift
//  DispatchQueueAndQosAndAttributes
//
//  Created by Banavath UdayKiran Naik on 19/07/24.
//

import Foundation

class SerialQueue {
    // MARK: - SerialQueues Examples
     let serialQueue = DispatchQueue(label: "com.Dispatch.SerialQueue")
     
     func doSerialQueueAsync() {
         serialQueue.async {
             for i in 1...3 {
                 if(Thread.isMainThread) {
                     print("Task Running on Main Thread.")
                 } else {
                     print("Task Running On Other Thread.")
                 }
                 print("Task A execution is completed. \(i) ✅")
             }
         }
         
         serialQueue.async {
             for i in 1...3 {
                 print("Task B executiion is completed. \(i) 🅾️")
             }
         }
         print("Serial Queue Fuction exited.")
     }
    
    func doSerialQueueSync() {
        serialQueue.sync {
            for i in 1...3 {
                if(Thread.isMainThread) {
                    print("Task Running on Main Thread.")
                } else {
                    print("Task Running On Other Thread.")
                }
                print("Task A execution is completed. \(i) ✅")
            }
        }
        
        serialQueue.async {
            for i in 1...3 {
                print("Task B executiion is completed. \(i) 🅾️")
            }
        }
        print("Serial Queue Fuction exited.")
    }
}
