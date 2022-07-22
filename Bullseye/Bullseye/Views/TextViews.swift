//
//  TextViews.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 11/07/2022.
//

import SwiftUI


//InstructionText
struct InstructionText: View {
    var text:String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
            
    }
}

//BigNumberText
struct BigNumberText: View{
    var text: String
    var body: some View{
       Text(text)
            .kerning(-1)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

//SliderLabelText
struct SliderLabelText: View {
    var text : String
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
            .frame(width:35.0)
    }
}

//LabelText
struct LabelText: View {
    var text : String
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}
struct BodyText: View {
    var text : String
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
           
    }
}
struct ButtonText: View {
    var text : String
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth:.infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
           
    }
}

struct ScoreText: View {
    var score : Int
    var body: some View{
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date : Date
    var body: some View{
        Text(date,style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBolText: View{
    let text:String
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text:"Instructions")
            BigNumberText(text: "Text")
            SliderLabelText(text:"1")
            LabelText(text: "9")
            BodyText(text: "Your Scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            BigBolText(text: "Leaderboard")
            
        }
        .padding()
    }
}
