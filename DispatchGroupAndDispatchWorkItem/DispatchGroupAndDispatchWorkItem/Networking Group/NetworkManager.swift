//
//  NetworkManager.swift
//  DispatchGroupAndDispatchWorkItem
//
//  Created by Banavath UdayKiran Naik on 20/07/24.
//

import Foundation

class NetworkManager {
    static func fetchData(api: String, completionHandler: @escaping(Error?, Data?)->Void) {
        let url = URL(string: api)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            completionHandler(error, data)
        }.resume()
    }
    
    // MARK: - Mocking The UserName Availability check with DispatchQueue.
    private static let existingUserNameArray: [String] = ["uday123", "uday@1212", "udaykiran"]
    
    static func checkUserNameAvailability(userName: String, completionHandler: @escaping(Bool)->Void) {
        DispatchQueue.global().async {
            var userNameAvailable: Bool = true
            for name in existingUserNameArray {
                if name == userName {
                    userNameAvailable = false
                    break
                }
            }
            completionHandler(userNameAvailable)
        }
    }
}
