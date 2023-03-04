//
//  ScoresView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import SwiftUI

struct ScoresView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(model.ScoreGames, id:\.GameID){ item in
                        HStack{
                            Spacer()
                            VStack{
                                Spacer()
                                Text("\(item.HomeTeam) vs. \(item.AwayTeam) ")
                                Text("\(item.HomeTeamScore ?? 0)  \(item.AwayTeamScore ?? 0)")
                                Spacer()
                                Text(item.DateTime ?? "GameTime Not Found")
                                
                            }
                            Spacer()
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Games")
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(DataModel())
    }
}
