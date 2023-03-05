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
                                HStack{
                                    VStack{
                                        Image(item.HomeTeam)
                                            .resizable()
                                            .frame(width:50,height:50)
                                        Text(item.HomeTeam)
                                        Text("\(item.HomeTeamScore ?? 0)")
                                    }
                                    Text("VS.")
                                    VStack{
                                        Image(item.AwayTeam)
                                            .resizable()
                                            .frame(width:50,height:50)
                                        Text(item.AwayTeam)
                                        Text("\(item.AwayTeamScore ?? 0)")
                                    }
                                }
                                Spacer()
                                Text(item.DateTime ?? "GameTime Not Found")
                                
                            }
                            Spacer()
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Games")
            .toolbar{
                Image("nba")
                    .resizable()
                    .frame(width: 50,height: 50)
            }
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(DataModel())
    }
}
