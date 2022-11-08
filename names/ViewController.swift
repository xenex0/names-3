//
//  ViewController.swift
//  names
//
//  Created by Дмитрий Абдуллаев on 24.10.2022.
//

import UIKit


class ViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["name1", "name2", "name3"]
    let identifire = "MyCell"
    let nameKey = "nameKey"
    var textField1 = ""
    var indexPath: IndexPath = []
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let name = userDefaults.object(forKey: nameKey){
            self.array[indexPath.startIndex] = name as! String
        }
    }
    func addTableDelegate(addForViewController: String) {
        array[indexPath.row] = addForViewController
        tableView.reloadData()
    }
    
    @IBAction func buttonAlert(_ sender: UIButton)  {
        let alert =  UIAlertController(title: "select", message: "enter some name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "save", style: .default) { [self] _ in
            let alertText = alert.textFields?.first?.text
            array[indexPath.row] = alertText ?? "0"
            self.indexPath = indexPath
            userDefaults.set(self.array[self.indexPath.startIndex], forKey: nameKey)
            tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(alertAction)
        self.present(alert, animated: true)
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
            let alert = UIAlertController(title: "alert", message: "select person",preferredStyle: .alert)
            let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
            let alertAction = UIAlertAction(title: "Done", style: .default) { [self]  _ in
                let secondView = UIStoryboard(name: "Main", bundle: nil)
                let storyBoard = secondView.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                storyBoard.someText = array[indexPath.row]
                storyBoard.delegate = self
                self.show(storyBoard, sender: nil)
                self.indexPath = indexPath
            }
            alert.addAction(alertCancel)
            alert.addAction(alertAction)
            alert.addTextField() { (textField) in
                self.array[indexPath.row] = textField.text ?? ""
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
}


