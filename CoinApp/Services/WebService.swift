//
//  WebService.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation

class WebService{
    
    func downloadCurrencies(completion: @escaping (Result<[CryptoModel]?,DownloaderError>) -> Void ){
        
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "x-cg-demo-api-key": "CG-oTX7ejhbcFLSWLBCwjsb4tUk"
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(.badUrl))
                print(error.localizedDescription)
            }
            
            guard let data = data, error == nil else{
                print(error?.localizedDescription)
                return completion(.failure(.noData))
            }
            guard let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data) else{
                print(error?.localizedDescription)
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
            
        }.resume()
        
            
        
    }
    
    enum DownloaderError: Error{
        case badUrl
        case noData
        case dataParseError
    }
    
    
}
