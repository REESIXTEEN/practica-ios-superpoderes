//
//  ContentView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel = HomeViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack() {
                List {
                    ForEach($viewmodel.characters) { character in
                        HeroeRowView(heroe: character)
                    }
                }
                .navigationTitle("Marvel characters")
                .scrollContentBackground(.hidden)
//                .background(Rectangle().opacity(0.8))


            }
//            .background(Rectangle().opacity(0.8))
//            .background(Image(decorative: "background"))

        }
        .background(Color.blue)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = readJson(forName: "TestData")
        let vm = HomeViewModel()
        vm.characters = data

        return HomeView(viewmodel: vm)
    }
}
