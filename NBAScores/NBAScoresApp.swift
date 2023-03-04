//
//  NBAScoresApp.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import SwiftUI

@main
struct NBAScoresApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataModel())
        }
    }
}
