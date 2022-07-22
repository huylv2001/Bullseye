//
//  LeaderBoard.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 13/07/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing : Bool
    @Binding var game : Game
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing:10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView{
                    VStack(spacing:10){
                        ForEach(game.leaderboardEntries.indices){ i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                        
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index : Int
    let score : Int
    let date : Date
    var body: some View {
        HStack{
            RoundTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
            
            }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth : Constants.LeaderBoard.leaderboardMaxRolWidth)
    }
}

struct HeaderView : View {
    @Binding var leaderboardIsShowing : Bool
    @Environment(\.verticalSizeClass) var
    verticalSizeClass
    @Environment(\.horizontalSizeClass) var
    horizontalSizeClass
    var body: some View {
        ZStack {
            if verticalSizeClass == .regular &&
                horizontalSizeClass == .compact
            {
                BigBolText(text:"Leaderboard").padding(.leading)
                Spacer()
            }
            else {
                BigBolText(text:"Leaderboard")
                Spacer()
            }
            HStack{
                Spacer()
                Button(action:{
                    leaderboardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View{
    var body: some View{
        HStack{
            Spacer()
                .frame(width:Constants.General.roundViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth : Constants.LeaderBoard.leaderboardMaxRolWidth)
    }
}
struct LeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        let leaderboardIsShowing = Binding.constant(false)
        let game = Binding.constant(Game(loadTestData: true))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game:game)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game:game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game:game).preferredColorScheme(.dark)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game:game).preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
        
    }
}
