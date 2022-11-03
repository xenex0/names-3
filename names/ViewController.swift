//
//  ViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 24.10.2022.
//

import UIKit


class ViewController: UIViewController, ViewControllerDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var array: [String] = []
    
    let identifire = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
         array = ["name1", "name2", "name3"]
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = UITableViewCell(style: .default, reuseIdentifier: identifire)
       let number = array[indexPath.row]
        cell.textLabel?.text =  number
        
      return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if tableView.isExclusiveTouch == false {
            let alert = UIAlertController(title: "alert", message: "select person", preferredStyle: .alert)
            let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
            let alertAction = UIAlertAction(title: "Done", style: .default) { [self]  _ in
                
                let secondView = UIStoryboard(name: "Main", bundle: nil)
                
                let storyBoard = secondView.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
                storyBoard.someText = self.array[indexPath.row]
                
                self.show(storyBoard, sender: nil)
            }
            
            alert.addAction(alertCancel)
            alert.addAction(alertAction)
            alert.addTextField() { (textField) in
                textField.text = self.array[indexPath.row]
            }
            present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDeteails" {
            let addNames = segue.destination as! SecondViewController
            addNames.delegate = self
        }
    }
  
    func addTableDelegate(addForViewController: String) {
        self.dismiss(animated: true)
            array.append(addForViewController)
            self.tableView.reloadData()
    }
        }
        

