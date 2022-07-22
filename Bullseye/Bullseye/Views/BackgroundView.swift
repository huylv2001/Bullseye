//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 12/07/2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingView()
        )
    }
}
struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }) {
                RoundImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action:{
                leaderboardIsShowing = true
            }){
                RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing,
                    onDismiss: {},
                    content: {
                LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing,game: $game)
            } )
            
        }
    }
}
struct NumberView: View{
    var tittle: String
    var text: String
    var body: some View{
        VStack{
            LabelText(text: tittle.uppercased())
            RoundedRectTextView(text: text)
                
            }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(tittle: "Score", text: String(game.score))
            Spacer()
            NumberView(tittle: "Round", text: String(game.round))
        }
    }
}

struct RingView: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme ==
                    .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient:Gradient(colors: [Color("RingColor").opacity(opacity*0.8),Color("RingColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
                
            }
        }
    }
}
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
