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
        print(FileManager.docDirURL.path)
        if FileManager().docExists(named: fileName) {
            loadToDos()
        }
    }

    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
        saveToDos()
    }

    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id}) else { return }
        toDos[index] = toDo
        saveToDos()
    }

    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveToDos()
    }

    func loadToDos() {
        FileManager().readDocument(docName: fileName) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    toDos = try decoder.decode([ToDo].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func saveToDos() {
        print("Saving ToDos to file system")

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { error in
                guard let error = error else { return }
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
