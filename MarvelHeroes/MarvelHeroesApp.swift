//
//  MarvelHeroesApp.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

@main
struct MarvelHeroesApp: App {
    @StateObject var characterViewModel = CharacterViewModel()
    var body: some Scene {
        WindowGroup {
            CharactersListView(viewmodel: characterViewModel)
        }
    }
}
