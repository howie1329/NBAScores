//
//  StandingsView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import SwiftUI

struct StandingsView: View {
    @EnvironmentObject var model:DataModel
    var conSelections = ["East","West"]
    @State var conSelection = "East"
    var body: some View {
        NavigationView {
            VStack{
                Picker("Con", selection: $conSelection) {
                    ForEach(conSelections,id: \.self){
                        Text($0)
                    }
                }
                .padding(.horizontal)
                .pickerStyle(.segmented)
                HStack{
                    Text("Rank")
                        .frame(width: 45)
                    Text("Team")
                        .frame(width: 145)
                    Spacer()
                    Text("W - L")
                        .frame(width: 65)
                }
                .bold()
                .padding(.horizontal)
                Divider()
                if conSelection == "East"{
                    StandingsRow(conference: model.EastStandingsInfo)
                }
                else if conSelection == "West"{
                    StandingsRow(conference: model.WestStandingsInfo)
                }
                
            }
            .navigationTitle("Standings")
            .toolbar{
                Image("nba")
                    .resizable()
                    .frame(width: 50,height: 50)
            }
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
            .environmentObject(DataModel())
    }
}
