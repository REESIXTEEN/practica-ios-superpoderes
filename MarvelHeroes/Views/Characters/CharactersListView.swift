//
//  ContentView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject var viewmodel : CharacterViewModel
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                List {
                    ForEach(searchResults) { character in
                        CharacterRowView(character: character)
                            .background(
                                NavigationLink {
                                    SerieListView(viewmodel: SeriesViewModel(character: character))
                                } label: {
                                    
                                }.opacity(0)
                            )
                            .frame(width: geo.size.width*0.9)
                    }
                }
                .navigationTitle("Marvel characters")
                .scrollContentBackground(.hidden)
            }
            .searchable(text: $searchText)
            .alert(isPresented: $viewmodel.error.status) {
                Alert(title: Text("Error"), message: Text(viewmodel.error.description), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    var searchResults: [ResultCharacter] {
        if searchText.isEmpty {
            return viewmodel.characters
        } else {
            return viewmodel.characters.filter { $0.name.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CharacterViewModel(mock: true)
        return CharactersListView(viewmodel: vm)
    }
}
