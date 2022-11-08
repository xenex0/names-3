//
//  SecondViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 25.10.2022.
//

import UIKit

protocol ViewControllerDelegate {
   
   func addTableDelegate(addForViewController: String)
}

class SecondViewController: UIViewController {

    var someText = ""
    
    var delegate: ViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    textField.text = someText
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        let name = textField.text
        delegate?.addTableDelegate(addForViewController: name!) 
        dismiss(animated: true, completion: nil)
          print("hi \(name!)")
    }
}

