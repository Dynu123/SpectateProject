//
//  DetailView.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 25/02/22.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @State private var price: Price
    @State private var displayCurrency: String
    
    init(price: Price, displayCurrency: String) {
        self.price = price
        self.displayCurrency = displayCurrency
    }
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: price.image))
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                Text(price.name).bold()
                Text("(\(price.symbol))").bold()
                Spacer()
            }
            .padding(.bottom)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("More details")
                        .bold()
                        .padding(.vertical)
                    Group {
                        Text("Current price: \(price.currentPrice?.trimTrailingZeroes ?? "") (\(displayCurrency))")
                        Text("24Hour Change: \(price.priceChangePercentage24H.trimTrailingZeroes)%")
                        Text("Market cap: \(price.marketCap?.trimTrailingZeroes ?? "")")
                        Text("Market cap rank: \(price.marketCapRank?.trimTrailingZeroes ?? "")")
                        Text("Market cap change in 24H: \(price.marketCapChange24H.trimTrailingZeroes)")
                        Text("Market cap change percentage: \(price.marketCapChangePercentage24H?.trimTrailingZeroes ?? "")%")
                        Text("Total supply: \(price.totalSupply?.trimTrailingZeroes ?? "")")
                        Text("Circulating supply: \(price.circulatingSupply?.trimTrailingZeroes ?? "")")
                        Text("All Time High: \(price.ath?.trimTrailingZeroes ?? "")")
                        Text("All Time High date: \(price.allTimeHighDate)")
                    }
                    Group {
                        Text("Fully diluted valuation: \(price.fullyDilutedValuation?.trimTrailingZeroes ?? "")")
                        Text("Total volume: \(price.totalVolume.trimTrailingZeroes)")
                        Text("Low: \(price.low24H.trimTrailingZeroes)(24H)")
                        Text("High: \(price.high24H.trimTrailingZeroes)(24H)")
                        Spacer()
                        Text("Last updated on: \(price.updatedDate)")
                            .font(.footnote)
                    }
                }
                Spacer()
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(price: .sample, displayCurrency: "Eur")
    }
}
