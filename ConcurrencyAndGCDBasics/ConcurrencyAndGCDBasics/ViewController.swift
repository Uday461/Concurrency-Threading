//
//  ViewController.swift
//  ConcurrencyAndGCDBasics
//
//  Created by Banavath UdayKiran Naik on 30/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let customThread = CustomThread()
//        customThread.createCustomThread()
        
        let gcd = GCD()
        gcd.executeTask()
    }
}

