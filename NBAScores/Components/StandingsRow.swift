//
//  StandingsRow.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/5/23.
//

import SwiftUI

struct StandingsRow: View {
    var conference:[Standings]
    var body: some View {
        List{
            ForEach(conference, id:\.TeamID){ item in
                HStack{
                    Text("\(item.ConferenceRank )")
                    Image(item.Key)
                        .resizable()
                        .frame(width: 30,height: 30)
                    Text(item.City)
                    Text(item.Name)
                    Spacer()
                    Text("\(item.Wins) - \(item.Losses)")
                }
                .bold()
                
            }
        }
        .listStyle(.plain)
        
    }
}

