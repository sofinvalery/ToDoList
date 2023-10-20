//
//  TodoModel.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 10/9/23.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoModel {
        TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
