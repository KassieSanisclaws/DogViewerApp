//
//  ContentView.swift
//  DogViewer
//
//  Created by Kadeem Cherman on 2026-06-16.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var store = DogStore()

    var body: some View {
        VStack(spacing: 20) {
            Text("Random Dog Viewer").font(.largeTitle)
            
            if store.imageURL.isEmpty {
                ProgressView()
            } else {
                AsyncImage(url: URL(string: store.imageURL))
                { image in
                    image
                         .resizable()
                         .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
            Button("Load New Dogs") {
                Task {
                    await store.getDog()
                }
            }
        }
        .padding()
        .task {
            await store.getDog()
        }
    }
}

#Preview {
    ContentView()
}
