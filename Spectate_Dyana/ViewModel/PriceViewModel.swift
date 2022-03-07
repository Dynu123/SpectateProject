//
//  CurrencyViewModel.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 25/02/22.
//

import Foundation
import SwiftUI
import Combine

class PriceViewModel: ObservableObject {
    @Published var prices: [Price] = []
    @Published var isLoading: Bool = false
    var showError = PassthroughSubject<Bool,Never>()
    
    let priceDataSource: PriceDatasource?
    
    init(priceDatasource: PriceDatasource) {
        self.priceDataSource = priceDatasource
    }
    
    //using URLSession
    func fetchPriceList(displayCurrency: String, sparkLine: Bool) {
        showError.send(false)
        isLoading = true
        self.priceDataSource?.getAllPrices(displayCurrency: displayCurrency, sparkLine: sparkLine) { (result: Result<[Price], ServiceError>, statusCode)  in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let currencies):
                self.prices = currencies
                if self.prices.isEmpty {
                    AppError.shared.message = "No data found"
                    DispatchQueue.main.async {
                        self.showError.send(true)
                    }
                }
            case .failure(let error):
                AppError.shared.message = error.localizedDescription
                DispatchQueue.main.async {
                    self.showError.send(true)
                }
            }
        }
    }
}



