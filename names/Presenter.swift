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
    func showName()
}

class ViewPresenter: NamePresenter {
    
    required init(view: NameControllerPresenter) {
        self.view = view
    }
    
    let view: NameControllerPresenter
    
   weak var secondView: SecondViewController?
    
    func showName() {
        let name = secondView?.textField.text
        self.view.addTableDelegate(addForViewController: name!)
        print("2")
    }
}
