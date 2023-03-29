//
//  SerieRowView.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 29/3/23.
//

import SwiftUI

struct SerieRowView: View {
    @Binding var serie: ResultSeries
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension.rawValue)")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350,height: 500)
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
                    Text(serie.title)
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                    .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()

        }
        .frame(width: 350,height: 500)
        .background(.clear)
        .cornerRadius(8)
    }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        let serie = readSerieJson(forName: "SeriesData")[0]
        SerieRowView(serie: .constant(serie))
    }
}
