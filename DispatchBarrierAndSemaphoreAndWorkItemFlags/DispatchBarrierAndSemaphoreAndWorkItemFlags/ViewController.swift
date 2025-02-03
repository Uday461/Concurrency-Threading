//
//  ViewController.swift
//  DispatchBarrierAndSemaphoreAndWorkItemFlags
//
//  Created by Banavath UdayKiran Naik on 17/08/24.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let userName = userNameTextField.text, let password = passwordTextField.text else {
            print("Enter UserName/Password !!")
            return
        }
        
        if(userName.isEmpty || password.isEmpty) {
            print("Enter UserName/Password !!")
            return
        }
        
        guard let productPurchaseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductPurchaseVC") as? ProductPurchaseVC else {return}
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
        
        window.rootViewController = productPurchaseVC
        window.makeKeyAndVisible()
    }
}

