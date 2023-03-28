//
//  CharacterSeries.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 28/3/23.
//

import SwiftUI

struct SerieList: View {
    @Binding var series: [ResultSerie]
    var body: some View {
        List {
            ForEach($series) { serie in
                NavigationLink {
//                    CharacterSeries()
                } label: {
                    Text(serie.title)
                }
            }
        }
        .navigationTitle("Marvel characters")
        .scrollContentBackground(.hidden)
    }
}

struct CharacterSeries_Previews: PreviewProvider {
    static var previews: some View {
        let data = readSerieJson(forName: "SeriesData")
        SerieList(series: .constant(data))
    }
}
