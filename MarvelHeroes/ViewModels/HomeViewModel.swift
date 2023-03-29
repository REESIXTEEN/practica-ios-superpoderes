//
//  HomeViewModel.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import Foundation
import Combine

final class HomeViewModel : ObservableObject{
    
    @Published var characters: [Result] = []
    @Published var characterSeries: [ResultSeries] = []
    let network = Network()
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    
        
    init(){
        fetchCharacters()
        let serie = readSerieJson(forName: "SeriesData")[0]
        print(serie)
    }
    
    func fetchCharacters() {
        let request = baseNetwork.getCharacters()
        network.fetchApiData(type: Characters.self, request: request)
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
                self.characters = data.data.results
            }
            .store(in: &suscriptors)
    }
    
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
                self.characterSeries = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    
    
    
}
