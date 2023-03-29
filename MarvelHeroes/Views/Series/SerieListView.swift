//
//  CharacterSeries.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 28/3/23.
//

import SwiftUI

struct SerieListView: View {
    @StateObject var viewmodel:SeriesViewModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                List {
                    ForEach($viewmodel.series) { serie in
                        SerieRowView(serie: serie)
                            .frame(width: geo.size.width*0.9)
                    }
                }
                .navigationTitle(viewmodel.character.name + " (Series)")
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct CharacterSeries_Previews: PreviewProvider {
    static var previews: some View {
        let character = parseJson(filename: "CharactersData", type: DataModel.character.model)[0] as! Result
        let series = parseJson(filename: "SeriesData", type: DataModel.series.model) as! [ResultSeries]
        
        let vm = SeriesViewModel(character: character, mock: true)
        vm.series = series
        return SerieListView(viewmodel: vm)
    }
}
