//
//  DataStore.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import Foundation

class DataStore: ObservableObject {
    @Published var toDos: [ToDo] = []

    init() {
        loadToDos()
    }

    func addToDo(_ toDo: ToDo) {
        
    }

    func updateToDo(_ toDo: ToDo) {

    }

    func deleteToDo(at indexSet: IndexSet) {

    }

    func loadToDos() {
        toDos = ToDo.sampleData
    }

    func saveToDo() {
        print("Saving ToDos to file system eventually")
    }
}
