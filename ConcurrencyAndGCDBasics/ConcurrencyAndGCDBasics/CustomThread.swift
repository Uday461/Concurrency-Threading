//
//  CustomThread.swift
//  ConcurrencyAndGCDBasics
//
//  Created by Banavath UdayKiran Naik on 30/06/24.
//

import Foundation

class CustomThread {
    func createCustomThread() {
        let thread: Thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
        thread.start()
    }
    
    @objc func threadSelector() {
        print("Custom thread in action")
    }
}
