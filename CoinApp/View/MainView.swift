//
//  ContentView.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 13.06.2024.
//

import SwiftUI

struct MainView: View {
    var webService = WebService()
    var cryptoList = [CryptoModel]()
    var body: some View {
        NavigationStack{
            List(){
                HStack{
                    Text("Image").padding(.horizontal)
                    Text("Name")
                    Spacer()
                    Text("Price").padding(.horizontal)
                }.onTapGesture {
                    
                }
            }.navigationTitle("Crypto")
        }
    }
}

#Preview {
    MainView()
}
