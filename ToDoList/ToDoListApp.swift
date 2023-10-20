//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 9/30/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(todoViewModel)
        }
    }
}
