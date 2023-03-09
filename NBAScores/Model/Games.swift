//
//  Games.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import Foundation

struct Games: Decodable{
    
    var GameID: Int
    var Day: String
    var AwayTeam:String
    var HomeTeam:String
    var AwayTeamScore:Int?
    var HomeTeamScore:Int?
    var AwayTeamID:Int?
    var HomeTeamID:Int?
    var DateTime:String?
    var Channel:String?
    var Quarter:String?
    var Status:String?
    var TimeRemainingMinutes:Int?
    var TimeRemainingSeconds: Int?
}

struct Team: Decodable {
    
    var TeamID: Int?
    var WikipediaLogoUrl: String
    
}

struct Standings: Decodable {
    
    var TeamID: Int
    var Key: String
    var City: String
    var Name: String
    var Conference: String
    var Wins: Int
    var Losses: Int
    var ConferenceRank: Int
}

struct News: Decodable{
    
    var TimeAgo:String?
    var Title:String?
    var Content:String?
    var OriginalSource:String?
}

struct Quarter: Decodable{
    
    var Quarters: [Quarters]
}

struct Quarters:Decodable{
    
    var AwayTeam:String
    var HomeTeam:String
    var Number: Int
    var AwayScore: Int
    var HomeScore: Int
}
