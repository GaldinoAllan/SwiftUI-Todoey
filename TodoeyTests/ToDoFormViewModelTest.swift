//
//  ToDoFormViewModelTest.swift
//  ToDoFormViewModelTest
//
//  Created by allan galdino on 02/10/21.
//

import XCTest
@testable import Todoey

class ToDoFormViewModelTest: XCTestCase {

    // MARK: - Tests

    func testShouldInitializeToDoFormViewModel() {
        let toDoFormViewModel = ToDoFormViewModel()

        XCTAssertEqual(toDoFormViewModel.name, "")
        XCTAssertFalse(toDoFormViewModel.completed)
        XCTAssertNil(toDoFormViewModel.id)
        XCTAssertFalse(toDoFormViewModel.updating)
        XCTAssertTrue(toDoFormViewModel.isDisabled)
    }

    func testShouldInitializeToDoFormViewModelForUpdatingUncompleted() {
        let toDoFormViewModel = ToDoFormViewModel(ToDoModelFactory.getNewToDo(named: "test to do"))

        XCTAssertEqual(toDoFormViewModel.name, "test to do")
        XCTAssertFalse(toDoFormViewModel.completed)
        XCTAssertNotNil(toDoFormViewModel.id)
        XCTAssertTrue(toDoFormViewModel.updating)
        XCTAssertFalse(toDoFormViewModel.isDisabled)
    }

    func testShouldInitializeToDoFormViewModelForUpdatingCompleted() {
        let toDoFormViewModel = ToDoFormViewModel(ToDoModelFactory
                                                    .getCompletedToDo(named: "test to do"))

        XCTAssertEqual(toDoFormViewModel.name, "test to do")
        XCTAssertTrue(toDoFormViewModel.completed)
        XCTAssertNotNil(toDoFormViewModel.id)
        XCTAssertTrue(toDoFormViewModel.updating)
        XCTAssertFalse(toDoFormViewModel.isDisabled)
    }
}
