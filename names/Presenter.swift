//
//  Presenter.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 21.12.2022.
//

import Foundation

protocol NameViewDelegate: AnyObject {
    func showName(description:(Name))
}

class TrafficLightPresenter {
    private let name : Name
    weak private var nameViewDelegate : NameViewDelegate?
    
    init(name : Name){
        self.name = name
    }
    
    func setViewDelegate(nameViewDelegate : NameViewDelegate?){
        self.nameViewDelegate = nameViewDelegate
    }
    
    func getNameFrom(getName: String) {
    
    }
}
