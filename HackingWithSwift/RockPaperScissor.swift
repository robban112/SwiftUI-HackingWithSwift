//
//  RockPaperScissor.swift
//  HackingWithSwift
//
//  Created by Robert Lorentz on 2020-02-18.
//  Copyright © 2020 Robert Lorentz. All rights reserved.
//

import SwiftUI

struct RockPaperScissor: View {

    @State private var appMoveChoice: String = ""
    @State private var playerScore: Int = 0
    @State private var appScore: Int = 0
    @State private var question: Int = 0
    @State private var shouldShowFinalScore = false

    var moves = ["Rock", "Paper", "Scissor"]

    func selectMove(move: String) {
        appMoveChoice = moves[Int.random(in: 0..<3)]
        question += 1
        switch move {
        case "Rock":
            if appMoveChoice == "Scissor" {
                playerScore += 1
                appScore -= 1
            } else if appMoveChoice == "Paper" {
                playerScore -= 1
                appScore += 1
            }
        case "Paper":
            if appMoveChoice == "Rock" {
                playerScore += 1
                appScore -= 1
            } else if appMoveChoice == "Scissor" {
                playerScore -= 1
                appScore += 1
            }
        case "Scissor":
            if appMoveChoice == "Paper" {
                playerScore += 1
                appScore -= 1
            } else if appMoveChoice == "Rock" {
                playerScore -= 1
                appScore += 1
            }
        default:
            break
        }
        if question == 10 {
            shouldShowFinalScore = true
        }
    }


    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30.0) {
                Text("Current score: \(playerScore)")
                    .font(.headline)
                Text("App's current move: \(appMoveChoice)")
                    .font(.body)

                HStack() {
                    ForEach(0..<3) { i in
                        Button(action: {
                            self.selectMove(move: self.moves[i])
                        }) {
                            Text(self.moves[i])
                        }.modifier(ButtonModifier())
                    }
                }
            }
        }
    }
}

struct RockPaperScissor_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissor()
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
