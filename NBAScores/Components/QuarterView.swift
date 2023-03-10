//
//  NewScoreRow.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/7/23.
//

import SwiftUI

struct QuarterView: View {
    @EnvironmentObject var model:DataModel
    var homeTeam:String
    var awayTeam:String
    var body: some View {
        NavigationView{
            HStack(alignment:.center){
                VStack{
                    Text("Q #:")
                        .bold()
                    Divider()
                    Text(homeTeam)
                    Divider()
                    Text(awayTeam)
                }
                ForEach(model.Quarters, id:\.Number){item in
                    VStack{
                        Text("\(item.Number)")
                            .bold()
                        Divider()
                        Text(item.HomeTeam)
                        Text("\(item.HomeScore)")
                        Divider()
                        Text(item.AwayTeam)
                        Text("\(item.AwayScore)")
                        Divider()
                        
                    }
                }
            }
            .navigationTitle("Box Score")
            .padding()
        }
    }
}

struct QuarterView_Previews: PreviewProvider {
    static var previews: some View {
        QuarterView(homeTeam: "Team1", awayTeam: "Team2")
            .environmentObject(DataModel())
    }
}
