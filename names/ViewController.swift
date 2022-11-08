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
        
        if let name = userDefaults.object(forKey: nameKey) as? [String] {
            self.array = name
           
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
            array.append(alertText ?? "")
            userDefaults.set(self.array, forKey: nameKey)
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
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: identifire, sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "MyCell" {
            let addNames = segue.destination as! SecondViewController
            addNames.delegate = self
        }
    }
}


