//
//  PointsView.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 13/07/2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    var body: some View {
        let roundValued = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundValued)
        VStack(spacing:10){
            InstructionText(text: "The slider value is".uppercased())
            BigNumberText(text: String(roundValued))
            BodyText(text: "Your Scored \(points) Points\n🎉🎉🎉")
            Button(action:{
                alertIsVisible=false
                game.startNewRound(points: points)
            })
            {
            ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth:300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10,x:5,y:5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible =
    Binding.constant(false)
    static private var slideValue =
    Binding.constant(50.0)
    static private var game =
    Binding.constant(Game())
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game).preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
