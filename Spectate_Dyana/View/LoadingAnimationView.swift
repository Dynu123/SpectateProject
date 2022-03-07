//
//  LoadingAnimationView.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 27/02/22.
//

import SwiftUI

struct LoadingAnimationView: View {
    
    var radius: CGFloat = 32
    var count = 5
    var color = Color.accentColor
    
    @State private var rotation: Double = 0
    
    var body: some View {
        ActivityIndicatorView(style: .large)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var oldBody: some View {
        ZStack {
            Color(.systemGray4)
                .opacity(0.4)
            Circle()
                .fill(color)
                .frame(width: radius, height: radius)
            ForEach(0..<count) { index in
                Circle()
                    .trim(from: 0.0, to: 0.1 + CGFloat(index/6))
                    .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: radius + 20 + CGFloat(index * 30), height: radius + 20 + CGFloat(index * 30))
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation
                                .linear(duration: 3.0 / Double(count - index))
                                .repeatForever(autoreverses: false))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            rotation = 360
        }
        .transition(.opacity)
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}

