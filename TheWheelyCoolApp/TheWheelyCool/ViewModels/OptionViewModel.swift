//
//  OptionViewModel.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import Foundation
import CoreData


struct OptionViewModel {
    
    let option: Option
    
    var id: NSManagedObjectID {
        return option.objectID
    }
    
    var title: String {
        return option.title ?? ""
    }
}
