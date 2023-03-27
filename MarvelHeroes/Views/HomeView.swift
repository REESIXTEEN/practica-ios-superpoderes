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
        VStack {
            List{
                ForEach($viewmodel.heroes) { heroe in
                    HeroeRowView(heroe: heroe)
                }
            }
        }
        .padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = readJson(forName: "TestData")
        let vm = HomeViewModel()
        vm.heroes = data

        return HomeView(viewmodel: vm)
    }
}
