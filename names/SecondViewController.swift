//
//  SecondViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 25.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
   var someText = ""
        
   weak var delegate: NameControllerPresenter!
    
   var presenter: NamePresenter!
    
   @IBOutlet weak var textField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    textField.text = someText
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        let name = textField.text
        self.delegate.addTableDelegate(addForViewController: name!)
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}
    
