//
//  SwiftUIView.swift
//  ThinkWithYourMind
//
//  Created by Vincenzo Salzano on 22/02/25.
//

import SwiftUI

struct SwiftUIView: View {
    let phrases = [
        "In modern society, our ideas are contaminated by social networks, the media, and algorithms, which constrain our freedom of thought.",
        "Just think about politics or certain social issues, where people start presenting arguments in support of a thesis that seem to come more from a collective consciousness than from their own.",
        "This made me reflect… and I asked myself this question: is everything we think really 100% the product of our own mind?",
        "And how can we solve this problem?",
        "There can be multiple possible solutions: distancing ourselves from social media for a while, taking tests to understand how much our critical thinking is being influenced…",
        "But for a topic like this, can these 'possible solutions' really solve the problem?",
        "With this app, I have tried to offer a solution that seems simple, but at the core of a problem, sometimes simplicity holds the key to everything…",
        "Drum rolls…",
        "The solution is to question yourself and your own ideas!",
        "If you've done it this far and at least once thought: 'Have I also been influenced?' Or: 'How many people I know don't think with their own mind?'",
        "Then it means the app has been successful, because questioning yourself is the foundation for self-improvement and for developing your own critical thinking!",
        "Always think with your own mind!"
    ]
    
    @State private var currentPhraseIndex = 0
    @State private var displayedText = ""
    @State private var isTyping = false
    @State private var navigateToEasterEgg = false
    
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
                            navigateToEasterEgg = true
                        }
                    }) {
                        Text(currentPhraseIndex < phrases.count - 1 ? "Keep Talking" : "First Escape")
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
            .navigationDestination(isPresented: $navigateToEasterEgg) {
                EasterEggView()
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
    SwiftUIView()
}
