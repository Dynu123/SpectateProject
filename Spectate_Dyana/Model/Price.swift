//
//  Currency.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 25/02/22.
//

import Foundation

struct Price: Codable, Hashable {
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double
    let priceChange24H, priceChangePercentage24H: Double
    let marketCapChange24H: Double
    let marketCapChangePercentage24H, circulatingSupply, totalSupply, maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let roi: Roi?
    let lastUpdated: String?
    
    var updatedDate: String {
        return Date.convert(string: lastUpdated ?? "", from: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", to: "dd/MM/yyyy HH:mm:ss")
    }
    
    var allTimeHighDate: String {
        return Date.convert(string: athDate ?? "", from: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", to: "dd/MM/yyyy HH:mm:ss")
    }
}

struct Roi: Codable, Hashable {
    let times: Double
    let currency: String
    let percentage: Double
}

extension Roi {
    static var sample: Roi {
        Roi(times: 1, currency: "Eur", percentage: 20)
    }
}

extension Price {
    static var sample: Price {
        Price(id: "Bitcoin", symbol: "$", name: "Bitcoin", image: "", currentPrice: 10, marketCap: 12, marketCapRank: 12, fullyDilutedValuation: 12, totalVolume: 10, high24H: 12, low24H: 12, priceChange24H: 10, priceChangePercentage24H: 13, marketCapChange24H: 19, marketCapChangePercentage24H: 19, circulatingSupply: 12, totalSupply: 12, maxSupply: 12, ath: 12, athChangePercentage: 12, athDate: "13", atl: 14, atlChangePercentage: 12, atlDate: "15", roi: .sample, lastUpdated: "23.03.2022")
    }
}
