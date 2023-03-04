//
//  DataModel.swift
//  NBAScores
//
//  Created by Howard Thomas on 3/3/23.
//

import Foundation

class DataModel: ObservableObject {
    
    @Published var ScoreGames:[Games] = [Games]()
    @Published var TeamInfo:[Team] = [Team]()
    
    private let APIKEY = "03b394b31ab3466a9d951e0895cd941d"
    
    init(){
        getScoreGames()
        getTeamInfo()
    }
    
    
    func getScoreGames(){
        
        var URLString = "https://api.sportsdata.io/v3/nba/scores/json/GamesByDate/2023-03-03?key=03b394b31ab3466a9d951e0895cd941d"
        
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
                    gamesDataArr.append(contentsOf: result)
                    
                } catch {
                    print(error)
                }
                self.ScoreGames = gamesDataArr
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
                print(teamData)
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
