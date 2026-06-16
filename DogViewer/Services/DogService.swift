//
//  DogService.swift
//  DogViewer
//
//  Created by Kadeem Cherman on 2026-06-16.
//

import Foundation

struct DogService {
    func fetchDog() async throws -> DogResponse {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
          guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(DogResponse.self, from: data)
    }
}
