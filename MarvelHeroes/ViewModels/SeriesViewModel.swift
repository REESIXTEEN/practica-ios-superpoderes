//
//  SeriesViewModel.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 29/3/23.
//

import Foundation
import Combine


class SeriesViewModel: ObservableObject {
    
    @Published var series: [ResultSeries] = []
    let network = Network()
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    
    
    func fetchCharacterSeries(characterId: Int) {
        let request = baseNetwork.getCharacterSeries(characterId: String(characterId))
        network.fetchApiData(type: CharacterSeries.self, request: request)
            .sink { completion in
                switch completion{
                case .failure:
//                    self.status = Status.error(error: "Error buscando heroes")
                    print("")
                case .finished:
//                    self.status = .loaded
                    print("")
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)
    }
}
