//
//  APIManager.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 01/03/22.
//

import Foundation

class PriceRepository: PriceDatasource {
    func getAllPrices(displayCurrency: String, sparkLine: Bool, completion: @escaping (Result<[Price], ServiceError>, Int?) -> Void) {
        Service().request(endpoint: API.getAllCurrency(displayCurrency: displayCurrency, sparkline: sparkLine)) { (result: Result<[Price], ServiceError>, statusCode)  in
            completion(result, statusCode)
        }
    }
}

protocol PriceDatasource {
    func getAllPrices(displayCurrency: String, sparkLine: Bool, completion: @escaping (Result<[Price], ServiceError>, Int?) -> Void)
}
