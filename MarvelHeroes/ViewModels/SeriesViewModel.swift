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
    var character: Result
    var mock: Bool
    
    init(character:Result,mock:Bool = false){
        self.character = character
        self.mock = mock
        if(!mock) {fetchCharacterSeries()}
    }
    
    func fetchCharacterSeries() {
        let request = baseNetwork.getCharacterSeries(characterId: String(character.id))
        network.fetchApiData(type: CharacterSeries.self, request: request)
            .sink { completion in
                switch completion{
                case .failure:
                    debugPrint("Error getting the character series")
                case .finished:
                    debugPrint("Success getting the character series")
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)

        
    }
}
