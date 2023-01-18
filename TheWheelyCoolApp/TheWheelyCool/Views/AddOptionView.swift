//
//  AddOptionView.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import SwiftUI

struct AddOptionView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var optionListVM: OptionListViewModel

    @Binding var showView: Bool
    
    @State private var title: String = ""
    
    @FocusState private var focusedField: Fields?
    
    private enum Fields: Hashable {
        case title
        //in case there is more fields add here
    }
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(spacing: 100) {
                topButtons
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .opacity(0.5)
                        TextField(
                            "Type a new option here..",
                            text: $title
                        )
                        .frame(width: 250)
                        .disableAutocorrection(true)
                        .focused($focusedField, equals: .title)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .onAppear {
            //Set as first responder
            focusedField = .title
        }
        .onDisappear {
            //Resign first responder
            focusedField = nil
        }
        .onSubmit {
            createNewOption()
            dismiss()
        }
    }
    
    var topButtons: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .font(.subheadline)
            }
            Spacer()
            Text("New option")
                .font(.title3)
            Spacer()
            Button {
                createNewOption()
            } label: {
                Text("Done")
                    .font(.subheadline)
                    .bold()
            }
        }
        .padding(.top)
    }
    
    func createNewOption() {
        optionListVM.title = title.count > 0 ? title : "None"
        optionListVM.save()
        dismiss()
    }
}

struct AddOptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOptionView(showView: .constant(true))
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        
    }
}
