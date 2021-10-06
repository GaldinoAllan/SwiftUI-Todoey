//
//  ToDoModel.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import Foundation

struct ToDo: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
}
