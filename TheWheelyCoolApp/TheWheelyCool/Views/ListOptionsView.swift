//
//  ContentView.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import SwiftUI
import CoreData

struct ListOptionsView: View {
    
    @EnvironmentObject var optionListVM: OptionListViewModel
    @State private var showAddOptionView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(optionListVM.options, id: \.id) { option in
                        NavigationLink {
                            Text(option.title)
                                .font(Font.custom("Quicksand", size: 40))
                        } label: {
                            Text(option.title)
                                .font(Font.custom("Quicksand", size: 18))
                        }
                    }
                    .onDelete(perform: deleteOptions)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button {
                            showAddOptionView.toggle()
                        } label: {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddOptionView) {
                    AddOptionView(showView: $showAddOptionView)
                        .onDisappear{
                            optionListVM.fetchAllOptions()
                        }
                }

                buttonDone
            }
            .navigationTitle(Text("The Wheel"))
            .background(Color(uiColor: .secondarySystemBackground))
        }
        .navigationViewStyle(StackNavigationViewStyle()) //fix a bug from the version XCode 12.4 update
        .onAppear {
            //Use this to change settings from the navigationTitle
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name:"Quicksand", size: 40)!, .foregroundColor: UIColor(.accentColor)]
            
            optionListVM.fetchAllOptions()
        }
    }
    
    var buttonDone: some View {
        VStack {
            Spacer()
            NavigationLink {
                SpinWheelView(optionItems: optionListVM.getAllOptionTitles())
            } label: {
                Label("Done", systemImage: "checkmark")
                    .font(.title)
                    .labelStyle(.titleOnly)
                    .foregroundColor(Color("fontColor"))
            }
            .frame(width: 250, height: 70)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.accentColor))
            .padding(.bottom)
            .shadow(color: .accentColor, radius: 2, x: 1, y: 2)
            .disabled(optionListVM.options.isEmpty)
            .opacity(optionListVM.options.isEmpty ? 0.5 : 1)

        }
    }

    private func deleteOptions(offsets: IndexSet) {
        withAnimation {
            offsets.forEach { index in
                let option = optionListVM.options[index]
                optionListVM.delete(option)
            }
        }
        optionListVM.fetchAllOptions()
    }

}


struct ListOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOptionsView()
            .environmentObject(OptionListViewModel())
    }
}
