//
//  SwiftUIView 2.swift
//  ThinkWithYourMind
//
//  Created by Vincenzo Salzano on 22/02/25.
//

import SwiftUI

struct EasterEggView: View {
    @State private var isToggled = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("sfondo")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 100)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    Button("Easter Egg") {
                        withAnimation {
                            isToggled = true
                        }
                    }
                    .padding()
                    .background(Color("br1"))
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding()

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $isToggled) {
                SwiftUIView2()
                    .transition(.slide)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
