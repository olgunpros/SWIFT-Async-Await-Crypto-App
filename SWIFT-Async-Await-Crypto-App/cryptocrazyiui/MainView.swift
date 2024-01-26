//
//  ContentView.swift
//  cryptocrazyiui
//
//  Created by Olgun ‏‏‎‏‏‎ on 25.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    var body: some View {
        NavigationView {
        List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
            VStack {
                Text(crypto.currency)
                Text(crypto.price)
                   
                }
        }
        
        }.task {
            await cryptoListViewModel.downloadCryptosAsyns(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
        .onAppear() {
            
         // cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
             
       
    }
}

#Preview {
    MainView()
}
