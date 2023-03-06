//
//  ScoresRow.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/6/23.
//

import SwiftUI

struct ScoresRow: View {
    var dayModelArr:[Games]
    var body: some View {
        List{
            ForEach(dayModelArr, id:\.GameID){ item in
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
}
