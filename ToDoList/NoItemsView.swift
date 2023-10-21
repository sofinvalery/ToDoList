//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 10/13/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 40 : 60)
                .shadow(
                    color: .blue,
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 30 : 10)
                .scaleEffect(animate ? 1.05 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
