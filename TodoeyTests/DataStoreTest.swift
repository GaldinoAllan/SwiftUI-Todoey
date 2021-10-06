//
//  DataStoreTest.swift
//  TodoeyTests
//
//  Created by allan galdino on 06/10/21.
//

import XCTest
@testable import Todoey

class DataStoreTest: XCTestCase {

    let dataStore = DataStore(fileName: "testMockAPI.json")

    override func setUp() {
        dataStore.toDos = ToDoModelFactory.getThreeToDosArray()
    }

    func testShouldAddToDo() {
        dataStore.addToDo(ToDoModelFactory.getNewToDo(named: "new test To Do"))
        XCTAssertEqual(dataStore.toDos[3].name, "new test To Do")
    }

    func testShouldUpdateToDo() {
        let toDoId = dataStore.toDos[1].id
        dataStore.updateToDo(ToDo(id: toDoId,
                                  name: "newName",
                                  completed: true))

        XCTAssertEqual(dataStore.toDos[1].name, "newName")
        XCTAssertTrue(dataStore.toDos[1].completed)
    }

    func testShouldNotUpdateToDoWithInvalidId() {
        dataStore.updateToDo(ToDo(id: "1",
                                  name: "newName",
                                  completed: true))

        XCTAssertEqual(dataStore.toDos[1].name, "testToDo")
        XCTAssertFalse(dataStore.toDos[1].completed)
    }

    func testShouldDeleteToDo() {
        dataStore.deleteToDo(at: [1])
        XCTAssertEqual(dataStore.toDos.count, 2)
    }

    func testAppErrorShouldNotNilForFileNameNotFound() {
        dataStore.fileName = "testShouldFail"
        dataStore.loadToDos()

        XCTAssertNotNil(dataStore.appError?.error.errorDescription)
        dataStore.fileName = "testMockAPI.json"
    }
}
