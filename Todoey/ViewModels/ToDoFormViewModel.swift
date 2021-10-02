//
//  ToDoFormViewModel.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import Foundation

class ToDoFormViewModel: ObservableObject {

    // MARK: - Properties

    @Published var name = ""
    @Published var completed = false
    var id: String?
    var updating: Bool { id != nil }
    var isDisabled: Bool { name.isEmpty }

    // MARK: - Initializers

    init() {}

    init(_ currentToDo: ToDo) {
        name = currentToDo.name
        completed = currentToDo.completed
        id = currentToDo.id
    }
}
