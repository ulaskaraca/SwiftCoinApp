//
//  CryptoModel.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 6.07.2024.
//

import Foundation

struct CryptoModel: Hashable, Decodable, Identifiable{
    let id = UUID()
    let name: String
    let image: String
    let current_price: Double

}
