//
//  Model.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 21.12.2022.
//

import Foundation

struct Name {
    var names: [String]
    
    static func getNameData() -> Name {
        Name(names: ["name1","name2","name3"])
    }
}
