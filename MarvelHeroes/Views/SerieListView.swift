//
//  CharacterSeries.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 28/3/23.
//

import SwiftUI

struct SerieListView: View {
    @Binding var character: Result
    var body: some View {
        NavigationStack {
            List {
                //            ForEach($series) { serie in
                //                NavigationLink {
                ////                    CharacterSeries()
                //                } label: {
                //                    Text("caca")
                //                }
                //            }
                
                Text("caca")
                Text("caca")
            }
            .navigationTitle(character.name + "Series")
            .scrollContentBackground(.hidden)
        }
    }
}

struct CharacterSeries_Previews: PreviewProvider {
    static var previews: some View {
        let character = readCharacterJson(forName: "CharactersData")[1]
        SerieListView(character: .constant(character))
    }
}
