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
    var HomeTeamID:Int
    var DateTime:String?
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
