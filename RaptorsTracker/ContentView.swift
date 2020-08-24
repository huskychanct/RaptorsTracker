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
    @State var newGameDate: String = ""
    
    var searchBar:  some View {
        HStack {
            TextField("Enter Date of Game", text:
                self.$newGameDate)
            Button(action: self.addNewGame, label: {
                Text("Log Game")
            })
        }
    }
    
    func addNewGame () {
        gameHistory.games.append(Game(id:
            String(gameHistory.games.count + 1),
            opponent: newGameDate))
        self.newGameDate = ""
        // Auto generates ID for the Game once the date is added
    }
    
    var body: some View {
        NavigationView{
            VStack{
//                VStack(alignment: .center) {
//                    Image("raptorsLogo")
//                    Text("Raptors Tracker")
//                    searchBar.padding()
//                }
                Image("raptorsLogo")
                Text("Raptors Tracker")
                searchBar.padding()
                Spacer()
                List {
                    ForEach(self.gameHistory.games) { game in
                        Text(game.date)
                    }.onMove(perform: self.move)
                }.navigationBarItems(trailing: EditButton())
            }
        }
    }
    func move(from source : IndexSet, to destination: Int) {
        gameHistory.games.move(fromOffsets: source, toOffset: destination)
    } // Places the newly added game under the previous game
}



// For Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
