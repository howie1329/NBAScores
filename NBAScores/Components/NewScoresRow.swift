//
//  NewScoresRow.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/7/23.
//

import SwiftUI

struct NewScoresRow: View {
    @EnvironmentObject var model:DataModel
    var dayModelArr:[Games]
    @State var showBox = false
    @State var presentationDents = PresentationDetent.medium
    var body: some View {
        List{
            ForEach(dayModelArr, id: \.GameID){item in
                Button {
                    showBox.toggle()
                    model.homeTeam = item.HomeTeam
                    model.awayTeam = item.AwayTeam
                    model.getQuarters(gameID: item.GameID)
                } label: {
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            Text("ON: \(item.Channel ?? "")")
                            HStack{
                                VStack{
                                    Image(item.HomeTeam)
                                        .resizable()
                                        .frame(width:50,height:50)
                                    Text(item.HomeTeam)
                                    Text("\(item.HomeTeamScore ?? 0)")
                                }
                                VStack{
                                    if item.Quarter != nil{
                                        VStack{
                                            Text(item.Quarter ?? "")
                                                .bold()
                                            Text("\(item.TimeRemainingMinutes ?? 0):\(item.TimeRemainingSeconds ?? 0)")
                                                .bold()
                                        }
                                    }
                                    Text("VS.")
                                }
                                VStack{
                                    Image(item.AwayTeam)
                                        .resizable()
                                        .frame(width:50,height:50)
                                    Text(item.AwayTeam)
                                    Text("\(item.AwayTeamScore ?? 0)")
                                }
                            }
                            Spacer()
                            Text(item.Status ?? "")
                            Text(item.DateTime ?? "GameTime Not Found")
                            
                        }
                        Spacer()
                        
                    }
                }
                .sheet(isPresented: $showBox) {
                    QuarterView()
                        .presentationDetents([.medium], selection: $presentationDents)
                }

            }
        }
    }
}

