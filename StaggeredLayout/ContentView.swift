//
//  ContentView.swift
//  StaggeredLayout
//
//  Created by Nay Lin on 2025/07/26.
//

import SwiftUI

struct ContentView: View {
    let items = Array(1...30)

    var body: some View {
        ScrollView {
            StaggeredGridLayout(columns: 2) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.7))
                        .frame(height: CGFloat.random(in: 80...400))
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                        .padding(5)
                }
            }
        }
        .navigationTitle("Staggered Grid")
    }
}

#Preview {
    ContentView()
}
