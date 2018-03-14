//
//  ViewController.swift
//  iTexicoin
//
//  Created by Developer on 3/13/18.
//  Copyright © 2018 iTexico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bitsoWebService = CoinWebService()
    var bitconPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callBitsoWebService()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callBitsoWebService(){
        bitsoWebService.getCoinValue { (success, price) in
            if success{
                self.bitconPrice = price!
            }else{
                print("Error al tratar de alcanzar el WS")
            }
        }
    }
}

