//
//  ListRowView.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 10/13/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = TodoModel(title: "First item", isCompleted: false)
    static var item2 = TodoModel(title: "Second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}

#Preview {
    Group {
        ListRowView(item: TodoModel(title: "First item", isCompleted: false))
        ListRowView(item: TodoModel(title: "Second item", isCompleted: true))
    }
    .previewLayout(.sizeThatFits)
}
