//
//  ContentView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    var body: some View {
        TabView{
            ScoresView()
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("Scores")
                }
            StandingsView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Standings")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }.badge(model.SportNews.count)
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
