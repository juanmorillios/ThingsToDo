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
    var itemArray = ["Ir al Cine","Comprar Ropa","Ir al Supermercado","Visitar a la fámilia","Salir a comprar Leche"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Métodos DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsToDoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: Implementar Mñetodos del Delegado
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        print("Seleccionado: \(itemArray[indexPath.row])")
    }
    
    //MARK - add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ThingsTodo Item ", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           
            self.itemArray.append(textField.text ?? "")
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



