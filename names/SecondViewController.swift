//
//  SecondViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 25.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
   
    
   
    @IBOutlet weak var textField: UITextField!
    

    var someText = ""
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        textField.text = someText
        
        
    }
    
    @IBAction func textAction(_ sender: UITextField) {
        
    }
    
}

