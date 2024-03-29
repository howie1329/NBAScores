//
//  NewScoreRow.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/7/23.
//

import SwiftUI

struct QuarterView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        NavigationView{
            HStack(alignment:.center){
                VStack{
                    Text("Q #:")
                        .bold()
                    Divider()
                    Text(model.homeTeam)
                    Divider()
                    Text(model.awayTeam)
                }
                ForEach(model.Quarters, id:\.Number){item in
                    VStack{
                        Text("\(item.Number ?? 0)")
                            .bold()
                        Divider()
                        Text("\(item.HomeScore ?? 0)")
                        Divider()
                        Text("\(item.AwayScore ?? 0)")
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
        QuarterView()
            .environmentObject(DataModel())
    }
}
