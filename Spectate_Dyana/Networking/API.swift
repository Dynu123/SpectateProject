//
//  CurrentListEndpoint.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 27/02/22.
//

import Foundation

enum API: Endpoint {
    case getAllCurrency(displayCurrency: String, sparkline: Bool)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseUrl: String {
        switch self {
        default:
            return "api.coingecko.com"
        }
    }
    
    var path: String {
        switch self {
        default:
            return "/api/v3/coins/markets"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getAllCurrency(let displayCurrency, let sparkLine):
            return [URLQueryItem(name: "vs_currency", value: displayCurrency),
                    URLQueryItem(name: "sparkline", value: "\(sparkLine)")]
        }
    }
    
    var method: String {
        switch self {
        case .getAllCurrency:
            return "GET"
        }
    }
}
