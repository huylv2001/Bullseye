//
//  Game.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 11/07/2022.
//

import Foundation
 
struct LeaderboardEntry{
    let score : Int
    let date : Date
}


struct Game{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries : [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 89, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 87, date: Date()))
        }
    }
    func points(sliderValue: Int) -> Int {
        let different = abs(target-sliderValue)
        let bonus : Int
        if different == 0 {
            bonus = 100
        } else if different <= 2 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        
        return 100 - abs(sliderValue - self.target) + bonus
    }
    mutating func addToLeaderboard(points:Int){
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sorted{ $0.score > $1.score} 
    }
    
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
