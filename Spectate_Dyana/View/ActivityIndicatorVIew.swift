//
//  ActivityIndicatorVIew.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 27/02/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    var style = UIActivityIndicatorView.Style.large

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
