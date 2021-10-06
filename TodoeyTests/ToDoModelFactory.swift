//
//  ToDoModelFactory.swift
//  TodoeyTests
//
//  Created by allan galdino on 06/10/21.
//

import Foundation
@testable import Todoey

class ToDoModelFactory {
    static func getNewToDo(named name: String) -> ToDo {
        return ToDo(name: name)
    }

    static func getCompletedToDo(named name: String) -> ToDo {
        return ToDo(name: name, completed: true)
    }

    static func getThreeToDosArray() -> [ToDo] {
        let toDoArray = [getNewToDo(named: "testToDo"),
                         getNewToDo(named: "testToDo"),
                         getNewToDo(named: "testToDo")]
        return toDoArray
    }
}
