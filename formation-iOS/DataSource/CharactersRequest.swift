//
//  charactersRequest.swift
//  formation-iOS
//
//  Created by svetlana.lesik on 11/03/2022.
//

import Foundation

struct CharactersFetcher {
    
    enum CharactersFetcherError: Error {
        case invalidURL
        case missingData
        case invalidServerResponse
    }
    
    func fetchCharactersWithAsyncURLSession() async throws -> [Character] {
        
        let urlString = "https://akabab.github.io/starwars-api/api/all.json"
        
        // 1. Créer URL
        guard let url = URL(string: urlString) else {
            throw CharactersFetcherError.invalidURL
        }
        
        // 2. Créer URLSession
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpsResponse = response as? HTTPURLResponse, httpsResponse.statusCode == 200 else {
            throw CharactersFetcherError.invalidServerResponse
        }
        
        // 3.Parser la réponse
        var result: [Character]?
        do {
            result = try JSONDecoder().decode([Character].self, from: data)
        }
        catch {
            print("Failed to decode with error: \(error)")
        }
        
        guard let characters = result else {
            throw CharactersFetcherError.missingData
        }
    
        return characters
    }
    
}
