//
//  NewsDetailView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/6/23.
//

import SwiftUI

struct NewsDetailView: View {
    var Info:News
    var body: some View {
        VStack{
            HStack{
                Text(Info.Title ?? "")
                Spacer()
                Text(Info.TimeAgo ?? "" )
            }
            .bold()
            .font(.title2)
            Divider()
            VStack{
                Text(Info.Content ?? "")
            }
            Divider()
            HStack{
                Text(Info.OriginalSource ?? "")
            }
            Spacer()
            
        }
        .padding()
        .navigationTitle(Info.Title ?? "")
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(Info: News(TimeAgo: "2 Days",Title: "Thomas Out For the week",Content: "Top Gauard Howard Thomas Out For The Next Two Weeks", OriginalSource: "Howard W. Thomas"))
    }
}
