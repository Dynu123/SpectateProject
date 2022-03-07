//
//  Spectate_DyanaTests.swift
//  Spectate_DyanaTests
//
//  Created by Dyana Varghese on 28/02/22.
//

import XCTest
@testable import Spectate_Dyana
import Mockingbird

class Spectate_DyanaTests: XCTestCase {
    
    func testPriceList_withValidResponse_showsListWithValues() throws {
        
        let prices = Array(repeating: Price.sample, count: 100)
        let priceDatasource = mock(PriceDatasource.self)
        given(priceDatasource.getAllPrices(displayCurrency: "eur", sparkLine: false, completion: any())) ~> { (currency, sparkline, completion) in
            completion(.success(prices), 200)
          }
        
        let vm = PriceViewModel(priceDatasource: priceDatasource)
        vm.fetchPriceList(displayCurrency: "eur", sparkLine: false)
        XCTAssertNotNil(vm.prices)
        XCTAssertFalse(vm.prices.isEmpty)
        XCTAssertTrue(vm.prices.count == prices.count)
    }
    
    func testPriceList_withEmptyArray_showsNoDataFoundMessage() throws {
        
        let prices: [Price] = []
        let priceDatasource = mock(PriceDatasource.self)
        given(priceDatasource.getAllPrices(displayCurrency: "eur", sparkLine: false, completion: any())) ~> { (currency, sparkline, completion) in
            completion(.success(prices), nil)
          }
        
        let vm = PriceViewModel(priceDatasource: priceDatasource)
        vm.fetchPriceList(displayCurrency: "eur", sparkLine: false)
        XCTAssertNotNil(vm.prices)
        XCTAssertTrue(vm.prices.isEmpty)
        XCTAssertEqual(AppError.shared.message, "No data found")
    }
    
    func testPriceList_withFailure() throws {

        let priceDatasource = mock(PriceDatasource.self)
        given(priceDatasource.getAllPrices(displayCurrency: "eur", sparkLine: false, completion: any())) ~> { (currency, sparkline, completion) in
            let error = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Error occured"])
            completion(.failure(.serverError(error: error, message: "")), error.code)
          }
        
        let vm = PriceViewModel(priceDatasource: priceDatasource)
        vm.fetchPriceList(displayCurrency: "eur", sparkLine: false)
        XCTAssertEqual(AppError.shared.message, "Error occured")
    }
}
