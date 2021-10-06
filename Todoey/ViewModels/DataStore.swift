//
//  DataStore.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import Foundation

class DataStore: ObservableObject {
    @Published var toDos: [ToDo] = []
    @Published var appError: ErrorType? = nil

    var fileName: String

    init(fileName: String = mockApiFileName) {
        print(FileManager.docDirURL.path) /// printing path to see where the ToDos are being saved

        self.fileName = fileName

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
                    appError = ErrorType(error: .decodingError)
                }
            case .failure(let error):
                appError = ErrorType(error: error)
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
                appError = ErrorType(error: error)
            }
        } catch {
            appError = ErrorType(error: .encodingError)
        }
    }
}
