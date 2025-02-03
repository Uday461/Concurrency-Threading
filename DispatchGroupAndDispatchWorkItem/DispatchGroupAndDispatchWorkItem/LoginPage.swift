//
//  LoginPage.swift
//  DispatchGroupAndDispatchWorkItem
//
//  Created by Banavath UdayKiran Naik on 20/07/24.
//

import UIKit

class LoginPage: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdTextField.delegate = self
        passwordTextField.delegate = self
        errorLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    var userNameAvailabilityWorkItem: DispatchWorkItem? = nil
    
    func checkForNameAvailability(userName: String) {
        userNameAvailabilityWorkItem?.cancel()
        
        let workItem: DispatchWorkItem = DispatchWorkItem {
            NetworkManager.checkUserNameAvailability(userName: userName) { isUserNameAvailable in
                DispatchQueue.main.async {
                    self.errorLabel.isHidden = isUserNameAvailable
                }
            }
        }
        userNameAvailabilityWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now()+1, execute: workItem)
    }
}

extension LoginPage: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        errorLabel.isHidden = true
        if textField == userIdTextField {
            checkForNameAvailability(userName: textField.text?.appending(string) ?? "")
        } else if textField == passwordTextField {
           // print("Password textField method")
        }
        return true
    }
}
