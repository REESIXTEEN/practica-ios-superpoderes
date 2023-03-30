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
                    ForEach(viewmodel.series) { serie in
                        SerieRowView(serie: serie)
                            .frame(width: geo.size.width*0.9)
                    }
                }
                .navigationTitle(viewmodel.character.name + " (Series)")
                .scrollContentBackground(.hidden)
            }
            .alert(isPresented: $viewmodel.error.status) {
                Alert(title: Text("Error"), message: Text(viewmodel.error.description), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct CharacterSeries_Previews: PreviewProvider {
    static var previews: some View {
        let character = CharacterViewModel(mock: true).characters[0]
        let vm = SeriesViewModel(character: character, mock: true)
        
        return SerieListView(viewmodel: vm)
    }
}
