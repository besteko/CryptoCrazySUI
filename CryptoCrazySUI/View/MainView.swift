//
//  ContentView.swift
//  CryptoCrazySUI
//
//  Created by Beste Kocaoglu on 14.08.2023.
//

import SwiftUI

struct MainView: View {
    
    
    @ObservedObject var CryptoListViewModel : CryptoListViewModel
    
    init() {
        self.CryptoListViewModel = CryptoListViewModel()
    
    }
    
    
    var body: some View {
       
        NavigationView{
            
            List(CryptoListViewModel.cryptoList, id:\.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Text(crypto.price)
                        .foregroundColor(.black)
                }
            }.navigationTitle(Text("Crypto Crazy"))
            
        }.task {
          await  CryptoListViewModel.downloadCryptosAsync(url: URL( string : "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)

        }
        
        
        
       /* .onAppear{
            
                        
            //CryptoListViewModel.downloadCryptos(url: URL( string : //"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
