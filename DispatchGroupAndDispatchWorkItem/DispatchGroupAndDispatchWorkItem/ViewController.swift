//
//  ViewController.swift
//  DispatchGroupAndDispatchWorkItem
//
//  Created by Banavath UdayKiran Naik on 19/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var launchDataDispatchGroup: DispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            self.getAppLaunchData()
        }
    }
        
    func getAppLaunchData() {
        launchDataDispatchGroup.enter()
        
        // Download Task1
        NetworkManager.fetchData(api: EndPointConstants.config) { error, data in
            self.launchDataDispatchGroup.leave()
            if let data = data {
                print("Download Task1 has completed successfully!!")
            }
            
            if let error = error {
                print("Error in Download Task1!!")
            }
        }
        
        launchDataDispatchGroup.enter()
        
        //Download Task2
        NetworkManager.fetchData(api: EndPointConstants.preferences) { error, data in
            self.launchDataDispatchGroup.leave()
            if let data = data {
                print("Download Task2 has completed successfully!!")
            }
            
            if let error = error {
                print("Error in Download Task2!!")
            }
        }
        
   //     launchDataDispatchGroup.wait()
     
        
        let waitResult: DispatchTimeoutResult = launchDataDispatchGroup.wait(timeout: .now()+3)
        
        DispatchQueue.main.async {
            switch waitResult {
            case .success:
                print("API calls completed before timeOut")
            case .timedOut:
                print("API calls timedOut")
            }
            self.activityIndicator.stopAnimating()
            self.navigateToLoginPage()
        }
        
        
//        DispatchQueue.main.async {
//            print("All launch data download completed. Navigate To Login Page.✅")
//            self.activityIndicator.stopAnimating()
//            self.navigateToLoginPage()
//        }
        
//        launchDataDispatchGroup.notify(queue: .main) {
//            print("All launch data download completed. Navigate To Login Page.✅")
//            self.activityIndicator.stopAnimating()
//            self.navigateToLoginPage()
//        }

    }
        
    func navigateToLoginPage() {
        guard let loginPageVC: LoginPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as? LoginPage else {return}
            
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {
                return
        }
            
        window.rootViewController = loginPageVC
        window.makeKeyAndVisible()
    }
}

