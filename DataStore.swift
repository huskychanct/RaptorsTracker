//
//  DataStore.swift
//  RaptorsTracker
//
//  Created by jacob on 8/23/20.
//  Copyright © 2020 chan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Game : Identifiable {
    var id = String()
    var opponent = String()
    var date = String()
    var score = Int()
    var outcome = String()

    // Add more stuff later
}

class GameHistory : ObservableObject {
    @Published var games = [Game]()
}
