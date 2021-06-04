//
//  viewModel.swift
//  ToDoList101
//
//  Created by Macintosh on 6/3/21.
//

import Foundation

class viewModel : ObservableObject {
    @Published var data = [TodoData(title: "HomeWork SA", create_by: "Megumi", detail: "I can not do anything,I will definitely F in this subject.")]
    
    func addData( todo : TodoData) {
        data.append(todo)
    }
    
    func deleteData(at offsets: IndexSet) {
        data.remove(atOffsets: offsets)
    }
}
