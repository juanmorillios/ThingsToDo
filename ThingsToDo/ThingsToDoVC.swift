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
    
}

