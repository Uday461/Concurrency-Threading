//
//  ProductPurchaseVC.swift
//  DispatchBarrierAndSemaphoreAndWorkItemFlags
//
//  Created by Banavath UdayKiran Naik on 17/08/24.
//

import UIKit

class ProductPurchaseVC: UIViewController {

    @IBOutlet weak var walletCost: UILabel!
    
    @IBOutlet weak var totalCost: UILabel!
    
    var totalVal: Int = 0 {
        didSet {
            totalCost.text = "$\(totalVal)"
        }
    }
    
    var walletVal: Int = 40 {
        didSet {
            walletCost.text = "$\(walletVal)"
        }
    }
    
    let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    var products: [ProductModel] = [ProductModel(name: "Product1", price: 30), ProductModel(name: "Product2", price: 30)]
    let purchaseQueue = DispatchQueue(label: "com.purchaseQueue", attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walletCost.text = "$\(walletVal)"
        totalCost.text = "$\(totalVal)"
    }


    
    @IBAction func buyComboButtonPressed(_ sender: Any) {
        for product in products {
            purchaseQueue.async {
                self.buyProduct(product: product)
            }
            
//            purchaseQueue.async(flags: .barrier) { [weak self] in
//                self?.buyProduct(product: product)
//                print("WalletVal: \(self?.walletVal) && CostVal: \(self?.totalVal)")
//            }
        }
    }
    
    func buyProduct(product: ProductModel) {
        semaphore.wait()
        if walletVal > product.price {
            PurchaseManager.buyProduct(product: product) { [weak self] isSuccessful in
                guard let self = self else {return}
                
                if isSuccessful {
                    print("Product Added to cart Succesfully!!")
                    DispatchQueue.main.async() {
                        self.walletVal -= product.price
                        self.totalVal += product.price
                        self.semaphore.signal()
                    }
                }
            }
        } else {
            print("Choose other payment options.")
        }
    }
}
