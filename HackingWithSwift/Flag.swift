//
//  FlagView.swift
//  HackingWithSwift
//
//  Created by Robert Lorentz on 2020-02-18.
//  Copyright © 2020 Robert Lorentz. All rights reserved.
//

import SwiftUI

struct FlagView: View {

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreText = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreText = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreText = "Omg lol wrong noob this is the flag for \(countries[number])"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .frame(width: 200, height: nil, alignment: .center)

                        Text(countries[correctAnswer])
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    }
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.flagTapped(number)
                        }) {
                            Image(self.countries[number])
                                .renderingMode(.original)
                        }.clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)


                    }

                    Text("Current score: \(score)")
                            .foregroundColor(.white)

                    Spacer()
                }.alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("\(scoreText)"), dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                    })
                }
            }
        }

    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
