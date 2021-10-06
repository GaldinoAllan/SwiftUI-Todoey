//
//  FileManager+Extension.swift
//  Todoey
//
//  Created by allan galdino on 04/10/21.
//

import Foundation

let mockApiFileName = "mockAPI.json"

extension FileManager {
    static var docDirURL: URL {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func saveDocument(contents: String, docName: String, completion: (ToDoError?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(.saveError)
        }
    }

    func readDocument(docName: String, completion: (Result<Data, ToDoError>) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(.readError))
        }
    }

    func docExists(named docName: String) -> Bool {
        return fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
