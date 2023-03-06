//
//  ScoresView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var model:DataModel
    
    @State var viewDate = "Today"
    var dateChoices = ["Yesterday","Today","Tomorrow"]
    var body: some View {
        NavigationView {
            VStack{
                Picker("Days", selection: $viewDate) {
                    ForEach(dateChoices,id:\.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                if viewDate == "Today"{
                    ScoresRow(dayModelArr: model.ScoreGamesToday)
                }
                else if viewDate == "Yesterday"{
                    ScoresRow(dayModelArr: model.ScoreGamesYesterday)
                }
                else if viewDate == "Tomorrow"{
                    ScoresRow(dayModelArr: model.ScoreGamesTomorrow)
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
