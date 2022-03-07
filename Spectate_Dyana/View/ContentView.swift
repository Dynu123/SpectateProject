//
//  ContentView.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 25/02/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @ObservedObject var vm: PriceViewModel
    @State private var showError = false
    var displayCurrency: String = "eur"
    
    var body: some View {
        NavigationView {
            ZStack {
                if !showError {
                    List(vm.prices, id: \.id) { price in
                        NavigationLink(destination: DetailView(price: price, displayCurrency: displayCurrency)) {
                            HStack {
                                KFImage(URL(string: price.image))
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                Text(price.name)
                                Spacer()
                                Text("\(price.currentPrice?.trimTrailingZeroes ?? "")")
                                Spacer()
                                Text("\(price.priceChangePercentage24H.trimTrailingZeroes)%")
                            }
                            .padding(.vertical)
                        }
                    }
                    .refreshable {
                        vm.fetchPriceList(displayCurrency: displayCurrency, sparkLine: false)
                    }
                } else {
                    ErrorView(message: AppError.shared.message ?? "", btnTitle: "Retry") {
                        vm.fetchPriceList(displayCurrency: displayCurrency, sparkLine: false)
                    }
                }
                if vm.isLoading {
                    LoadingAnimationView()
                }
                
            }
            .navigationTitle("Crypto currency")
        }
        .onAppear {
            vm.fetchPriceList(displayCurrency: displayCurrency, sparkLine: false)
        }
        .onReceive(vm.showError) { value in
            self.showError = value
        }
    }
}





