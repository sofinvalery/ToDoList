//
//  ListView.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 9/30/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        ZStack {
            if todoViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(todoViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    todoViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: todoViewModel.deleteItem)
                    .onMove(perform: todoViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(destination: AddView()) {
                Image(systemName: "plus")
            }
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(TodoViewModel())
}
