//
//  SpinWheelView.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import SwiftUI
import FortuneWheel

struct SpinWheelView: View {
    
    @State private var displayAlert = false
    @State private var selectIndex = 0
    
    var optionItems : [String]
    let wheelColours : [Color] = [
        Color(hex: "557B83"),
        Color(hex: "39AEA9"),
        Color(hex: "D1DC59"),
        Color(hex: "A2D5AB"),
        Color(hex: "DE6037"),
        Color(hex: "E5EFC1"),
        Color(hex: "992C4D"),
        Color(hex: "433589"),
        Color(hex: "4660A8"),
        Color(hex: "4291C8")
    ]
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                //MARK: - Spin wheel View
                FortuneWheel(titles: optionItems, size: 320, onSpinEnd: { index in
                    selectIndex = index
                    displayAlert.toggle()
                }, colors: wheelColours, pointerColor: Color(hex: "630606"), strokeWidth: 15, strokeColor: Color("fontColor"), animDuration: 3, animation: Animation.timingCurve(0.51, 0.97, 0.56, 0.99, duration: 3))
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "hand.draw")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("Swipe to spin the wheel!")
                        .font(Font.custom("Shrikhand", size: 25))
                        .multilineTextAlignment(.center)
                        .frame(width: 240)
                }
                .foregroundColor(.accentColor)
                .padding(.bottom)
            }
            .blur(radius: displayAlert ? 1 : 0 )
            
            //MARK: - Alert View
            AlertView(title: optionItems[selectIndex])
                .offset(x: 0, y: displayAlert ? 0 : 1500)
                .animation(.spring(), value: displayAlert)

        }
        
    }
}

struct SpinWheelView_Previews: PreviewProvider {
    static var previews: some View {
        SpinWheelView(optionItems: ["🍤","🍿","🍫"])
    }
}
