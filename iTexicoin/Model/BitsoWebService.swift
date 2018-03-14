//
//  BitsoWebService.swift
//  iTexicoin
//
//  Created by Developer on 3/13/18.
//  Copyright © 2018 iTexico. All rights reserved.
//

import Foundation

class CoinWebService: NSObject {
    var price = ""
    
    func getCoinValue(_ completionHandler: @escaping (_ success: Bool ,_ bitcoin: String?) -> Void) {
        let url = URL(string: "https://api.bitso.com/v3/trades/?book=btc_mxn")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    guard let jsonArr = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else{return}
                    
                    if let payload = jsonArr.value(forKey: "payload") as? NSArray{
                        
                        for pay in payload {
                            if let  payDic = pay as? NSDictionary {
//                                if let amount = payDic.value(forKey: "amount") as? NSString{
//                                    // print(coinInfo.amount)
//                                }
//
//                                if let book = payDic.value(forKey: "book") as? NSString{
//                                    // print(coinInfo.book)
//                                }
                                
//                                if let created_at = payDic.value(forKey: "created_at") as? NSString{
//                                    // print(coinInfo.created_at)
//                                }
                                
//                                if let maker_side = payDic.value(forKey: "maker_side") as? NSString{
//                                    // print(coinInfo.maker_side)
//                                }
                                
                                if let price = payDic.value(forKey: "price") as? NSString{
                                    self.price = price as String
                                    // print(coinInfo.price)
                                }
                                
//                                if let tid = payDic.value(forKey: "tid") as? NSString{
//                                    // print(coinInfo.tid)
//                                }
//
                            }
                        }
                        //  print(coinInfoArray.count)
                        
                        completionHandler(true,self.price)
                    }else{
                        
                        completionHandler(false,nil)
                    }
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
        // Infinitely run the main loop to wait for our request.
        // Only necessary if you are testing in the command line.
        RunLoop.main.run()
    }
}
