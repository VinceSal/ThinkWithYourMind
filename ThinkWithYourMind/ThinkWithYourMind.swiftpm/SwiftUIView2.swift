//
//  SwiftUIView 2.swift
//  ThinkWithYourMind
//
//  Created by Vincenzo Salzano on 22/02/25.
//

import SwiftUI

struct SwiftUIView2: View {
    let phrases = [
        "Oh, you're still here! Well, you've probably wondered why everything is so dark and why there's no one you're actually talking to…",
        "Well, this app simulates a real conversation with your consciousness—the only one that can make you doubt yourself and push you to question your beliefs!",
        "Moreover, the black background is an analogy that reflects the behavior of those who express an opinion that isn't truly their own, as if they were navigating in the dark.",
        "But, as much as it pains me, we've really reached the moment of farewell. I hope this idea has opened your mind and can help many others do the same!"
    ]
    
    @State private var currentPhraseIndex = 0
    @State private var displayedText = ""
    @State private var isTyping = false
    @State private var navigateToThanksView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("parole")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()

                    Text(displayedText)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.4)
                        .minimumScaleFactor(0.7)
                        .lineLimit(nil)
                        .background(Color.black.opacity(0.3)) 
                        .cornerRadius(10)
                    
                    Spacer()

                    Button(action: {
                        if currentPhraseIndex < phrases.count - 1 {
                            currentPhraseIndex += 1
                            startTyping(phrase: phrases[currentPhraseIndex])
                        } else {
                            navigateToThanksView = true
                        }
                    }) {
                        Text(currentPhraseIndex < phrases.count - 1 ? "Keep Talking" : "Real Escape")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("br1"))
                            .cornerRadius(15)
                            .padding(.bottom, 50)
                            .padding(.horizontal)
                    }
                    .disabled(isTyping)
                    .opacity(isTyping ? 0.5 : 1.0)
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                startTyping(phrase: phrases[currentPhraseIndex])
            }
            .navigationDestination(isPresented: $navigateToThanksView) {
                ThanksView()
                    .transition(.slide)
            }
        }
    }
    
    private func startTyping(phrase: String) {
        displayedText = ""
        isTyping = true
        
        for (index, char) in phrase.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.015) {
                self.displayedText.append(char)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(phrase.count) * 0.015) {
            isTyping = false
        }
    }
}

#Preview {
    SwiftUIView2()
}
