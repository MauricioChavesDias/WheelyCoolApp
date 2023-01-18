//
//  TheWheelyCoolApp.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import SwiftUI

@main
struct TheWheelyCoolApp: App {
    
    @StateObject var optionsListVM = OptionListViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(optionsListVM)
        }
    }
}
