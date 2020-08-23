//
//  ContentView.swift
//  RaptorsTracker
//
//  Created by jacob on 8/22/20.
//  Copyright © 2020 chan. All rights reserved.
//

import SwiftUI
import Combine


struct ContentView: View {
    @ObservedObject var gameHistory = GameHistory()
    @State var newGame: String = ""
    
    var searchBar:  some View {
        HStack {
            TextField("Enter in a new game", text:
                self.$newGame)
            Button(action: self.addNewGame, label: {
                Text("Log New Game")
            })
        }
    }
    
    func addNewGame () {
        
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .center) {
                    Image("raptorsLogo")
                    Text("Raptors Tracker")
                    searchBar.padding()
                }
                Spacer()
                List(self.gameHistory.games){ game in
                    Text(game.opponent)
                }
            }
        }
    }
}



// For Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
