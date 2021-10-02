//
//  ContentView.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStoreViewModel: DataStoreViewModel
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStoreViewModel.toDos) { toDo in
                    Button {

                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Todoey")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStoreViewModel())
    }
}
