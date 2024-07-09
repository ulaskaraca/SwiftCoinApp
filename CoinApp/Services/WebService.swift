//
//  WebService.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation
import SwiftUI

class WebService{
    
    func downloadCurrencies(url: String, completion: @escaping (Result<[CryptoModel]?,DownloaderError>) -> Void ){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if data != nil{
                    do{
                        let decodedData = try JSONDecoder().decode([CryptoModel].self, from: data!)
                        completion(.success(decodedData))
                       
                    }catch{
                        print(error)
                        completion(.failure(.dataParseError))
                    }
                }
                
            }.resume()
        }
        
        
    }
                
                /*if let error = error{
                    print(error.localizedDescription)
                    //completion(.failure(.badUrl))
                }
                guard let data = data, error == nil else{
                    return completion(.failure(.noData))
                }
                /*guard let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data) else{
                    return completion(.failure(.dataParseError))
                }*/
                do{
                    print(data)
                    let decodedData = try? JSONDecoder().decode([CryptoModel].self, from: data)
                    print(decodedData)
                }catch{
                    print(error.localizedDescription)
                }
               */
               
                //completion(.success(currencies as! [CryptoModel]))
                
                
            //}.resume()
    
    enum DownloaderError: Error{
        case badUrl
        case noData
        case dataParseError
    }
    
    
}
