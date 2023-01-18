//
//  AlertView.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 18/3/2022.
//

import SwiftUI

struct AlertView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var optionListVM: OptionListViewModel
    
    var title: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                VStack(spacing: 5) {
                    Text(title)
                        .font(Font.custom("Quicksand", size:30))
                    .padding(.top)
                    Text((optionListVM.options.count > 1) ? "You are lucky! 😀" : "Of course 🙄")
                        .font(.caption)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Try Again")
                        .foregroundColor(Color("fontColor"))
                        .font(.system(size: 22))
                }
                .frame(width: 180, height: 60)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.accentColor))
                .padding(.bottom)
                
            }
            .frame(width: 250, height: 180)
            .shadow(color: Color("fontColor"), radius: 20, x: 10, y: -10)
            .background(
                RoundedRectangle(cornerRadius: 20).foregroundColor(Color("fontColor"))
            )
        }
  
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(title: "Option 3")
    }
}
