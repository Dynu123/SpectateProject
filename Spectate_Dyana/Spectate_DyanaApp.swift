//
//  Spectate_DyanaApp.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 25/02/22.
// For 888Spectate group

import SwiftUI

@main
struct Spectate_DyanaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: PriceViewModel(priceDatasource: PriceRepository()))
        }
    }
}
