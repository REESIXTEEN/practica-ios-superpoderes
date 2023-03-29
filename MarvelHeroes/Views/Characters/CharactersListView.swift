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
                
                //                .background(Rectangle().opacity(0.8))
                
                
                //            .background(Rectangle().opacity(0.8))
                //            .background(Image(decorative: "background"))
            }
            .searchable(text: $searchText)

        }
    }
    
    var searchResults: [Result] {
        if searchText.isEmpty {
            return viewmodel.characters
        } else {
            return viewmodel.characters.filter { $0.name.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = parseJson(filename: "CharactersData", type: DataModel.character.model)
        let vm = CharacterViewModel(mock: true)
        vm.characters = data as! [Result]

        return CharactersListView(viewmodel: vm)
    }
}
