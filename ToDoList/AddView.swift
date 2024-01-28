//
//  AddView.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 10/13/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            todoViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Todo item must me at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    Group {
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.light)
        .environmentObject(TodoViewModel())
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(TodoViewModel()) 
    }
}
