//
//  RoundView.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 12/07/2022.
//

import SwiftUI

struct RoundImageViewStroked: View {
    var systemName:String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .overlay(
            Circle()
                .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}
struct RoundedImageViewFilled: View{
    var systemName:String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .background(
            Circle()
                .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}
struct PreviewView: View{
    var body: some View{
        VStack(spacing:10){
            RoundImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "100")
            RoundTextView(text:"1")
        }
    }
}

struct RoundedRectTextView: View{
    var text:String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
                )
    }
}

struct RoundTextView: View{
    let text : String
    var body: some View{
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .overlay(
            Circle()
                .strokeBorder(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
