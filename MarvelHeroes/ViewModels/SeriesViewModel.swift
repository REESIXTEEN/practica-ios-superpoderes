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
    @Published var error = vmError()
    let network = Network()
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    var character: ResultCharacter
    var mock: Bool
    
    init(character:ResultCharacter,mock:Bool = false){
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
                    self.error.description = "Error getting the marvel series from the Marvel API"
                    self.error.status = true
                case .finished:
                    debugPrint("Success getting the character series")
                    self.error.status = false
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)

        
    }
}
