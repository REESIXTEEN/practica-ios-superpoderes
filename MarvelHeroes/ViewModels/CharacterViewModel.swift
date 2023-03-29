//
//  HomeViewModel.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import Foundation
import Combine

final class CharacterViewModel : ObservableObject{
    
    @Published var characters: [Result] = []
    let network = Network()
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    var mock: Bool
    
        
    init(_ mock:Bool = false){
        self.mock = mock
    }
    
    func fetchCharacters() {
        if(!mock){
            let request = baseNetwork.getCharacters()
            network.fetchApiData(type: Characters.self, request: request)
                .sink { completion in
                    switch completion{
                    case .failure:
                        debugPrint("Error getting the marvel characters")
                    case .finished:
                        debugPrint("Success getting the marvel characters")
                    }
                } receiveValue: { data in
                    self.characters = data.data.results
                }
                .store(in: &suscriptors)
        }
    }
    

    
    
    
    
}
