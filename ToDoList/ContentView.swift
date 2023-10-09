//
//  ContentView.swift
//  ToDoList
//
//  Created by Valeriy Sofin on 9/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "rainbow")
                .symbolRenderingMode(
                    .multicolor
                    )
                .symbolEffect(
                    .variableColor
                        .iterative
                        .reversing
                        .hideInactiveLayers
                    )
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
