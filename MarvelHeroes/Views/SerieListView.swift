//
//  CharacterSeries.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 28/3/23.
//

import SwiftUI

struct SerieListView: View {
    var character: Result
    @StateObject var viewmodel = SeriesViewModel()
    
    var body: some View {
        viewmodel.fetchCharacterSeries(characterId: character.id)
        return GeometryReader { geo in
            NavigationStack {
                List {
                    ForEach($viewmodel.series) { serie in
                        SerieRowView(serie: serie)
                            .frame(width: geo.size.width*0.9)
                    }
                }
                .navigationTitle(character.name + " (Series)")
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct CharacterSeries_Previews: PreviewProvider {
    static var previews: some View {
        let character = readCharacterJson(forName: "CharactersData")[0]
        let series = readSeriesJson(forName: "SeriesData")
        let vm = SeriesViewModel()
        vm.series = series
        return SerieListView(character: character, viewmodel: vm)
    }
}
