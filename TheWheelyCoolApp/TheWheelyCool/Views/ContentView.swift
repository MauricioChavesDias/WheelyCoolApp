//
//  ContentView.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ListOptionsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
