//
//  CharacterViewModel.swift
//  formation-iOS
//
//  Created by svetlana.lesik on 11/03/2022.
//

import Foundation

class CharacterViewModel {
    var characters: [Character]?
    
    func getCharacters() async -> [Character] {
        var characters: [Character] = []
        do {
        characters = try await CharactersFetcher().fetchCharactersWithAsyncURLSession()
        }
        catch {
            print(error)
        }
        return characters
    }
}
