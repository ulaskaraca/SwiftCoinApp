//
//  ContentView.swift
//  CoinApp
//
//  Created by Ulaş Ardıl KARACA on 13.06.2024.
//

import SwiftUI

struct MainView: View { 
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init() {
        
        self.cryptoListViewModel = CryptoListViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList, id: \.id){ crypto in
                HStack{
                    AsyncImage(url: URL(string: crypto.image)){result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }.frame(width: 60, height: 60)
                        .padding(.horizontal)
                        
                    
                    Text(crypto.name)
                    Spacer()
                    Text(String(crypto.current_price)).padding(.horizontal)
                    
                }
                
            }
            .onAppear(perform: {
                cryptoListViewModel.downloadCryptos()
            })
        }
    }
}

#Preview {
    MainView()
}
