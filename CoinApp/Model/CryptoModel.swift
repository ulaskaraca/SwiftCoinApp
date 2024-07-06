//
//  CryptoModel.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation

struct CryptoModel: Identifiable, Decodable{
    let id: String
    let name: String
    let image: String
    let current_price: Int

}
