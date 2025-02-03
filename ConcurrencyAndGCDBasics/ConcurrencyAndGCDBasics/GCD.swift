//
//  GCD.swift
//  ConcurrencyAndGCDBasics
//
//  Created by Banavath UdayKiran Naik on 14/07/24.
//

import Foundation

class GCD {
    func executeTask() {
        DispatchQueue.main.async {
            for i in 0...3 {
                print(i)
            }
        }
        
        for i in 4...6 {
            print(i)
        }
        
        DispatchQueue.main.async {
            print(9)
        }
    }
}
