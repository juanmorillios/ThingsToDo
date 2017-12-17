//
//  Item.swift
//  ThingsToDo
//
//  Created by Juan Morillo on 17/12/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import Foundation
class Item {
    let title: String
    let done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
