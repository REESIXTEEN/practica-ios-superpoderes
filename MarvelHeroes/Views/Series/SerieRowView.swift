//
//  SerieRowView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 29/3/23.
//

import SwiftUI

struct SerieRowView: View {
    var serie: ResultSeries
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension.rawValue)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height:geo.size.height)
                        .clipped()
                    
                } placeholder: {
                    ProgressView()
                        .scaleEffect(x:3,y:3)
                }
                .id(0)

                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .center))
                    .opacity(0.8)
                    .id(1)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(serie.title)
                            .font(.title2)
                            .bold()
                            .lineLimit(2)
                        .foregroundColor(.white)
                        .id(2)
                        
                        Spacer()
                    }
                    if let descripction = serie.description {
                        HStack {
                            Text(descripction)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                                .bold()
                                .lineLimit(5)
                            .foregroundColor(.white)
                            .id(3)
                        }
                    }

                }
                .padding()

            }
            .cornerRadius(8)
            
        }
        .frame(height: 400)
    }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        let character = CharacterViewModel(mock: true).characters[0]
        let vm = SeriesViewModel(character: character, mock: true)
        let serie = vm.series[1]
        SerieRowView(serie: serie)
    }
}
