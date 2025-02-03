//
//  PurchaseManager.swift
//  DispatchBarrierAndSemaphoreAndWorkItemFlags
//
//  Created by Banavath UdayKiran Naik on 18/08/24.
//

import Foundation

class PurchaseManager {
   class func buyProduct(product: ProductModel, completionHandler: @escaping(Bool)->(Void)) {
        DispatchQueue.global().async {
            if(product.name.isEmpty || product.price == 0) {
                completionHandler(false)
            }
            completionHandler(true)
        }
    }
}
