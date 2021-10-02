//
//  ModalType.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import SwiftUI

enum ModalType: Identifiable, View {
    case new
    case update(ToDo)

    // MARK: - Properties

    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    // MARK: - Body

    var body: some View {
        switch self {
        case .new:
            return ToDoFormView(formViewModel: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(formViewModel: ToDoFormViewModel(toDo))
        }
    }
}
