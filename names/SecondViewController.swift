//
//  SecondViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 25.10.2022.
//

import UIKit


class SecondViewController: UIViewController {
    
    var someText = ""
        
   var delegate: NameControllerPresenter?
    
   weak var presenter: NamePresenter?
    

    @IBOutlet weak var textField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    textField.text = someText
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        presenter?.showName()
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}

