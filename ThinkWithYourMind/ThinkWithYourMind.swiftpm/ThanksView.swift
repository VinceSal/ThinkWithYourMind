//
//  SwiftUIView 2.swift
//  ThinkWithYourMind
//
//  Created by Vincenzo Salzano on 22/02/25.
//

import SwiftUI

struct ThanksView: View {
    var body: some View {
        ZStack {
            Image("grazie")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 100)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ThanksView()
}
