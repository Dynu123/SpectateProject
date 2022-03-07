//
//  ErrorView.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 26/02/22.
//

import SwiftUI

struct ErrorView: View {
    @State private var heading: String
    @State private var message: String
    @State private var btnTitle: String
    @State var action: () -> Void
    
    init(heading: String = "Oops!", message: String, btnTitle: String, action: @escaping () -> Void) {
        self.heading = heading
        self.message = message
        self.btnTitle = btnTitle
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 30 ) {
            Text(heading)
            Text(message)
                .multilineTextAlignment(.center)
            Button("Retry", action: action)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.secondary.opacity(0.3)
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(heading: "Oops!", message: "Failed", btnTitle: "Retry", action: {})
    }
}
