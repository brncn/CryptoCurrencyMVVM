//
//  ConnectionService.swift
//  CryptoCurrency
//
//  Created by Apollo on 29.04.2023.
//

import Foundation

class ConnectionService {
    
    func downloadCurrency(url: URL, completion: @escaping ([CryptoModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
            let cryptoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                
                print(cryptoList)
                completion(cryptoList)
            }
        }.resume()
        
    }
    
    
    
    
}
