//
//  CryptoViewModel.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation

struct CryptoViewModel{
    let crypto: CryptoModel
    var id: String{
        crypto.id
    }
    var name: String{
        crypto.name
    }
    var image: String{
        crypto.image
    }
    var current_price:Int{
        crypto.current_price
    }
    
    class CryptoListViewModel: ObservableObject{
        let webservice = WebService()
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
        let apiKey = "CG-oTX7ejhbcFLSWLBCwjsb4tUk"
        @Published var cryptoList = [CryptoViewModel]()
        
        func downloadCryptos(){
            webservice.downloadCurrencies(url: url, apiKey: apiKey) { result in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let cryptos):
                    if let cryptos = cryptos{
                        DispatchQueue.main.async{
                            self.cryptoList = cryptos.map(CryptoViewModel.init)
                        }
                    }
                }
            }
        }
        
        
    }
    
    
}