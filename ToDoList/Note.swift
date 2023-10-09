//
//  Note.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 10/9/23.
//

import SwiftUI

class Note: ObservableObject {
    @Published var items = [TodoItem]()
    
    func add(item: TodoItem) {
        items.append(item)
    }
}
