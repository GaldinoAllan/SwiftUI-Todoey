//
//  ToDoModel.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import Foundation

struct ToDo: Identifiable, Codable {

    // MARK: - Properties

    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false

    // MARK: - Sample data for visualization
    
    static var sampleData: [ToDo] {[
        ToDo(name: "Get groceries"),
        ToDo(name: "Make Dr. Appointment", completed: true)
    ]}
}
