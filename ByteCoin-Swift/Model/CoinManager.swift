//
//  CoinManager.swift
//  ByteCoin-Swift
//
//  Created by Mariola Hullings on 12/9/23.
//

import UIKit

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    
}

enum Enviroment {
    enum Keys {
        static let apiKey = "API_KEY"
    }
    
    static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist not found")
        }
        return dict
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Enviroment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API not found")
        }
        return apiKeyString
    }()
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=\(Enviroment.apiKey)"
    let apiKey = Enviroment.apiKey
    
//    func fetchRate() {
//        let urlString = baseURL
//        performRequest(with: urlString)
//    }
    
    func getCoinPrice(for currency: String) {
        let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=\(Enviroment.apiKey)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func performRequest(with urlString: String) {
        
        //1. create URL
        if let url = URL(string: urlString){
            //2. create a URL session
            let session = URLSession(configuration: .default)
            
            //3. give URL session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                        let dataString = String(decoding: safeData, as: UTF8.self)
                        print("Received data as string: \(dataString ?? "Invalid data")")
                }
            }
                task.resume()
                //4. start the task
        }
    }
    
}
