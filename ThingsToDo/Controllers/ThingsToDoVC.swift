//
//  ThingsToDoVC.swift
//  ThingsToDo
//
//  Created by Juan Morillo on 16/12/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class ThingsToDoVC: UITableViewController {
    
    //Data Sample
   var arrayItem = [Item]()
    
    //MARK - Add Persisten Local
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //upDateDataArrayItems()
      
        let newItem = Item()
        newItem.title = "Comprar leche"
        newItem.done = true
        arrayItem.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Ir al cine"
        newItem2.done = true
        arrayItem.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Ir a la montaña"
        arrayItem.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Salir al parque"
        newItem4.done = false
        arrayItem.append(newItem4)
      
    }
    
//    func upDateDataArrayItems() {
//        if let items = defaults.array(forKey: "ListItemsArray") as? [String] {
//            itemArray = items
//  }
//    }
    
    // MARK: Métodos DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsToDoCell", for: indexPath)
        let itemArray = arrayItem[indexPath.row]
        cell.textLabel?.text = itemArray.title
   
        if arrayItem[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: Implementar Mñetodos del Delegado
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        arrayItem[indexPath.row].done = !arrayItem[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ThingsTodo Item ", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           
            let newItem = Item()
            newItem.title = textField.text!
            
            self.arrayItem.append(newItem)
            
           // self.defaults.set(self.arrayItem, forKey: "ListItemsArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            print(alertTextField)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}



