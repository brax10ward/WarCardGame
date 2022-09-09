//
//  ContentView.swift
//  war-challenge
//
//  Created by Braxton Ward on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack() {
                Spacer()
                Image("logo")
                Spacer()
                HStack() {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    
                    // Generate a new number between 2 & 13
                    let playerNumber = Int.random(in: 2...13)
                    let cpuNumber = Int.random(in: 2...13)
                    
                    // Update the cards
                    playerCard = "card" + String(playerNumber)
                    cpuCard = "card" + String(cpuNumber)
                    
                    // Update the score
                    if playerNumber > cpuNumber {
                        playerScore += 1
                    } else if (cpuNumber > playerNumber) {
                        cpuScore += 1
                    }
                }) {
                    Image("dealbutton")
                }
                Spacer()
                HStack() {
                    Spacer()
                    VStack() {
                        Text("Player").font(.headline).padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle)
                    }.padding()
                    Spacer()
                    VStack() {
                        Text("CPU").font(.headline).padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle)
                    }.padding()
                    Spacer()
                }.foregroundColor(Color.white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
