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
    let network = Network()
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    
        
    init(){
        fetchCharacters()
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
    
    func fetchCharacterSeries(characterId: String) {
        let request = baseNetwork.getCharacterSeries(characterId: characterId)
        network.fetchApiData(type: CharacterSerie.self, request: request)
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
//                self.heroes = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    
    
    
}
