//
//  DataModel.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import Foundation

class DataModel: ObservableObject {
    
    @Published var ScoreGamesToday:[Games] = [Games]()
    @Published var ScoreGamesTomorrow:[Games] = [Games]()
    @Published var ScoreGamesYesterday:[Games] = [Games]()
    @Published var TeamInfo:[Team] = [Team]()
    @Published var StandingsInfo:[Standings] = []
    @Published var EastStandingsInfo:[Standings] = []
    @Published var WestStandingsInfo:[Standings] = []
    
    
    private let APIKEY = "03b394b31ab3466a9d951e0895cd941d"
    
    init(){
        getScoreGames(inputDate: "Today")
        getScoreGames(inputDate: "Yesterday")
        getScoreGames(inputDate: "Tomorrow")
        getTeamInfo()
        getStandings()
    }
    
    func getStandings(){
        
        let url = URL(string: "https://api.sportsdata.io/v3/nba/scores/json/Standings/2023?key=03b394b31ab3466a9d951e0895cd941d")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            var currentStandingsArr:[Standings] = []
            var currentStandingsEastArr:[Standings] = []
            var currentStandingsWestArr:[Standings] = []
            
            if error == nil {
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Standings].self, from: data!)
                    for item in result {
                        var rank = item.ConferenceRank
                        var teamID = item.TeamID
                        var wins = item.Wins
                        var losses = item.Losses
                        var key = item.Key
                        var name = item.Name
                        var conference = item.Conference
                        var city = item.City
                        
                        if conference == "Eastern"{
                            currentStandingsEastArr.append(Standings(TeamID: teamID, Key: key, City: city, Name: name, Conference: conference, Wins: wins, Losses: losses, ConferenceRank: rank))
                        }
                        else if conference == "Western"{
                            currentStandingsWestArr.append(Standings(TeamID: teamID, Key: key, City: city, Name: name, Conference: conference, Wins: wins, Losses: losses, ConferenceRank: rank))
                        }
                    }
                    
                    currentStandingsArr.append(contentsOf: result)
                } catch{
                    print(error)
                }
                self.StandingsInfo = currentStandingsArr
                
                currentStandingsEastArr.sort { t1, t2 in
                    return t1.ConferenceRank < t2.ConferenceRank
                }
                currentStandingsWestArr.sort { t1, t2 in
                    return t1.ConferenceRank < t2.ConferenceRank
                }
                
                self.EastStandingsInfo = currentStandingsEastArr
                self.WestStandingsInfo = currentStandingsWestArr
            }
        }
        dataTask.resume()
    }
    
    func getDate(inputDate:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let day = Calendar.current.startOfDay(for: Date())
        
        switch(inputDate){
        case "Today":
            let today = day + 0
            return dateFormatter.string(from: today)
            
        case "Yesterday":
            let yesterday = day - 86400
            return dateFormatter.string(from: yesterday)
            
        case "Tomorrow":
            let tommrow = day + 86400
            return dateFormatter.string(from: tommrow)
        default:
            let today = day + 0
            return dateFormatter.string(from: today)
        }
        
    }
    
    func getScoreGames(inputDate:String){
        let todayFormatted = getDate(inputDate: inputDate)
        
        let URLString = "https://api.sportsdata.io/v3/nba/scores/json/GamesByDate/\(todayFormatted)?key=03b394b31ab3466a9d951e0895cd941d"
        
        let url = URL(string: URLString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            var gamesDataArr:[Games] = []
            if error == nil {
                do{
                    let decorder = JSONDecoder()
                    let result = try decorder.decode([Games].self, from: data!)
                    for data in result{
                        let date = data.DateTime
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                        let newDate = dateFormatter.date(from: data.DateTime!)
                        
                        let GameID = data.GameID
                        let Day = data.Day
                        let AwayTeam = data.AwayTeam
                        let HomeTeam = data.HomeTeam
                        let AwayTeamScore = data.AwayTeamScore
                        let HomeTeamScore = data.HomeTeamScore
                        let AwayTeamID = data.AwayTeamID
                        let HomeTeamID = data.AwayTeamID
                        let DateTime = newDate?.formatted(date: .omitted, time: .complete)
                        gamesDataArr.append(Games(GameID: GameID, Day: Day, AwayTeam: AwayTeam, HomeTeam: HomeTeam,AwayTeamScore: AwayTeamScore, HomeTeamScore: HomeTeamScore, AwayTeamID: AwayTeamID, HomeTeamID: HomeTeamID, DateTime: DateTime))
                    }
                    
                } catch {
                    print(error)
                }
                
                if inputDate == "Today"{
                    self.ScoreGamesToday = gamesDataArr
                }
                else if inputDate == "Yesterday"{
                    self.ScoreGamesYesterday = gamesDataArr
                }
                else if inputDate == "Tomorrow"{
                    self.ScoreGamesTomorrow = gamesDataArr
                }
                
                
            }
        }
        dataTask.resume()
    }
    
    func getTeamInfo(){
        
        let pathString = Bundle.main.path(forResource: "TeamInfo", ofType: "json")
        
        let url = URL(fileURLWithPath: pathString!)
        var teamDataArr:[Team] = []
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do{
                
                let teamData = try decoder.decode([Team].self, from: data)
                teamDataArr.append(contentsOf: teamData)
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
        
        self.TeamInfo = teamDataArr
    }
}
