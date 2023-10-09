//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 9/30/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var note = Note()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
