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
        
        GeometryReader { geo in
            NavigationStack {
                List {
                    ForEach($viewmodel.characters) { character in
                        CharacterRowView(character: character)
                            .background(
                                NavigationLink {
                                    SerieListView(character: character)
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
//        .background(Color.blue)
        
    
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
