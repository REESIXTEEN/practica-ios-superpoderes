//
//  ContentView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject var viewmodel = HomeViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            ZStack() {
                List {
                    ForEach($viewmodel.characters) { character in
                        NavigationLink {
//                            viewmodel.fetchCharacterSeries(characterId: character.id)
                            SerieListView(character: character)
                        } label: {
                            CharacterRowView(character: character)
                        }
                    }
                }
                .navigationTitle("Marvel characters")
                .scrollContentBackground(.hidden)
//                .background(Rectangle().opacity(0.8))


            }
//            .background(Rectangle().opacity(0.8))
//            .background(Image(decorative: "background"))

        }
        .background(Color.blue)
        .searchable(text: $searchText)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = readCharacterJson(forName: "CharactersData")
        let vm = HomeViewModel()
        vm.characters = data

        return CharactersListView(viewmodel: vm)
    }
}
