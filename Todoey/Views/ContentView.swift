//
//  ContentView.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @Environment(\.colorScheme) var colorScheme
    @State private var modalType: ModalType? = nil

    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button {
                        modalType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
                .onDelete(perform: dataStore.deleteToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Todoey")
                        .font(.largeTitle)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modalType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    }
                }
            }
        }
        .sheet(item: $modalType) { $0 }
        .alert(item: $dataStore.appError) { appError in
            Alert(title: Text("Oh Oh"),
                  message: Text(appError.error.localizedDescription))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
