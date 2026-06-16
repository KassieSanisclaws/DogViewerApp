//
//  DogStore.swift
//  DogViewer
//
//  Created by Kadeem Cherman on 2026-06-16.
//

import Foundation
import Combine

@MainActor
class DogStore: ObservableObject {
    @Published var imageURL = ""
    let service = DogService()
    
    func getDog() async {
        do {
            let dog = try await service.fetchDog()
            imageURL = dog.message
        } catch {
            print(error)
        }
    }
}
