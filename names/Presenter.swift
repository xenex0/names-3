//
//  Presenter.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 21.12.2022.
//

import Foundation

protocol NameControllerPresenter: AnyObject {
   func addTableDelegate(addForViewController: String)
}

protocol NamePresenter: AnyObject {
    init(view: NameControllerPresenter)
}

class ViewPresenter: NamePresenter {
   
    required init(view: NameControllerPresenter ) {
        self.view = view
    }
    
    weak var view: NameControllerPresenter!
    
    var secondView: SecondViewController!
    
   
    }

