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
        toDos.append(toDo)
    }

    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id}) else { return }
        toDos[index] = toDo
    }

    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }

    func loadToDos() {
        toDos = ToDo.sampleData
    }

    func saveToDo() {
        print("Saving ToDos to file system eventually")
    }
}
