//
//  HeroeRowView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

struct HeroeRowView: View {
    @Binding var heroe: Result
    
    var body: some View {
        ZStack(){
            AsyncImage(url: URL(string: "\(heroe.thumbnail.path).\(heroe.thumbnail.thumbnailExtension.rawValue)")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(0.5)
                    .foregroundColor(.gray)
                    .scaledToFill()
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .opacity(0.4)
        }
        .overlay(
            Text(heroe.name)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(height: 50),
            alignment: .bottomLeading
        )
        .overlay(
            Image(systemName: "heart")
                .font(.title)
                .foregroundColor(.white)
                .padding(),
            alignment: .topTrailing
        )
//        .frame(width: .infinity,height: 300)
        .scaledToFit()
        .cornerRadius(16)
    }
}

struct HeroeRowView_Previews: PreviewProvider {
    static var previews: some View {
        let heroe = readJson(forName: "TestData")[0]
        
        HeroeRowView(heroe: .constant(heroe))
    }
}
