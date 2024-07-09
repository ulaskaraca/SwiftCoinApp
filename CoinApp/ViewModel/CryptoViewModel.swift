//
//  CryptoViewModel.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation

struct CryptoViewModel{
    let crypto: CryptoModel
    var id: UUID?{
        crypto.id
    }
    var name: String{
        crypto.name
    }
    var image: String{
        crypto.image
    }
    var current_price:Double{
        crypto.current_price
    }
}
    
class CryptoListViewModel: ObservableObject{
    @Published var cryptoList = [CryptoViewModel]()
        
    let webservice = WebService()
    let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&x-cg-demo-api-key=[APIKEY]"
        
    func downloadCryptos(){
        self.cryptoList.removeAll(keepingCapacity: false)
        webservice.downloadCurrencies(url: url){ result in
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
