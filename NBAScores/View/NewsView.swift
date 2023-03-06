//
//  NewsView.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/6/23.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(model.SportNews,id: \.Title){item in
                        NavigationLink {
                            NewsDetailView(Info: item)
                        } label: {
                            HStack{
                                Text(item.Title ?? "")
                                Spacer()
                                Text(item.TimeAgo ?? "")
                                
                            }
                        }
                    }
                }
                .refreshable {
                    model.getNews()
                }
            }
            .navigationTitle("News")
            .toolbar{
                Image("nba")
                    .resizable()
                    .frame(width: 50,height: 50)
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(DataModel())
    }
}
