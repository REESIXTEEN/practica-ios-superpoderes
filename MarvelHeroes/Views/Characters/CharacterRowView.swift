//
//  HeroeRowView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Result
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension.rawValue)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height:geo.size.height)
                        .clipped()
                    
                } placeholder: {
                    ProgressView()
                        .scaleEffect(x:3,y:3)
                }

                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .center))
                    .opacity(0.8)
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "heart")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                    HStack {
                        Text(character.name)
                            .font(.title2)
                            .bold()
                            .lineLimit(1)
                        .foregroundColor(.white)
                        Spacer()
                    }
                }
                .padding()

            }
            .cornerRadius(8)
            
        }
        .frame(height: 200)
        
    }

}

struct HeroeRowView_Previews: PreviewProvider {
    static var previews: some View {
        let character = readCharacterJson(forName: "CharactersData")[1]
        
        CharacterRowView(character: character)
    }
}