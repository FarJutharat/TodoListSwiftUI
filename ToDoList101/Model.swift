//
//  Model.swift
//  ToDoList101
//
//  Created by Macintosh on 6/3/21.
//

import Foundation

class TodoData : Identifiable {
    let id = UUID()
    let title : String
    let create_by : String
    let detail : String
    
    init(title: String ,create_by: String, detail: String) {
        self.title = title
        self.create_by = create_by
        self.detail = detail
    }
    func isEmpty() -> Bool {
        if title == "" && create_by == "" && detail == "" {
            return true
        }else{
            return false
        }
    }
}
//version 1
extension TodoData {
    //test merge
    //
}
