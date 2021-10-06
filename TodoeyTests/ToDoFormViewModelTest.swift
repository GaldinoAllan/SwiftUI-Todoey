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
}
