//
//  ListViewController.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import Foundation


class OptionListViewModel : ObservableObject {
    
    var title: String = ""
    
    @Published var options: [OptionViewModel] = []

    
    func fetchAllOptions () {
        options = CoreDataManager.shared.fetchAllOptions().map(OptionViewModel.init)
    }
    
    func save() {
        let option = Option(context: CoreDataManager.shared.viewContext)
        option.title = title
        
        CoreDataManager.shared.save()
        clearFields()
    }
    
    func delete(_ option: OptionViewModel) {
        if let existingOption = CoreDataManager.shared.getOptionByID(id: option.id) {
            CoreDataManager.shared.delete(option: existingOption)
            clearFields()
        }
    }
    
    func create(option: OptionViewModel) {
        let newOption = Option(context: CoreDataManager.shared.viewContext)
        CoreDataManager.shared.create(option: newOption)
        clearFields()
    }
    
    func clearFields() {
        title = ""
    }
    
    func getAllOptionTitles() -> [String] {
        return options.compactMap({$0.title})
    }
}
