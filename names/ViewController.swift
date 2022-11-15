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
    var identifire = "MyCell"
    let nameKey = "nameKey"
    var textField1 = ""
    var indexPath: IndexPath = []
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
         
            if let name = userDefaults.object(forKey: nameKey) as? [String] {
                array = name
        }
    }
    func loadSettings() {
        userDefaults.set(array, forKey: nameKey)
    }
    
    func addTableDelegate(addForViewController: String) {
        array[indexPath.row] = addForViewController
        loadSettings()
        tableView.reloadData()
    }
    
    @IBAction func itemBar(_ sender: UIBarButtonItem) {
        let alert =  UIAlertController(title: "select", message: "enter some name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "save", style: .default) { [self] _ in
            let alertText = alert.textFields?.first?.text
            array.append(alertText ?? "")
            loadSettings()
            tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    @IBAction func editItem(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
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
        performSegue(withIdentifier: identifire, sender: self)
        self.indexPath = indexPath
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == UITableViewCell.EditingStyle.delete{
            array.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.none)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        loadSettings()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "MyCell" {
            let addNames = segue.destination as! SecondViewController
            addNames.delegate = self
            addNames.someText = array[(tableView.indexPathForSelectedRow?.row)!]
            tableView.reloadData()
        }
    }
}


