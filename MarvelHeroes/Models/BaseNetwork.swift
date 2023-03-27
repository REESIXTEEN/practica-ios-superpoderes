//
//  BaseNetwork.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 27/3/23.
//

import Foundation

let server = "https://gateway.marvel.com:443/"
let apikey = "d757693108c7a879f4a5186b86e48d77"
let hash = "78e85293f475d4a35479bff84e110fca"
let ts = "1"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints : String {
    case characters = "v1/public/characters"
    case characterSeries = "v1/public/characters/{characterId}/series"
}


struct BaseNetwork {
    
    func getCharacters() -> URLRequest {
        let urlString : String = "\(server)\(endpoints.characters.rawValue)"
 
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apikey),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "ts", value: ts)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethods.get

        return request
    }
    
    //lista de heroes
//    func getCharactereries(filter:String) -> URLRequest{
//        let urlcad : String = "\(server)\(endpoints.characterSeries.rawValue)"
//        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
//        request.httpMethod = HTTPMethods.post
//
//        request.httpBody = try? JSONEncoder().encode(HerosFilter(name: filter))
//        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
//
//        //>Seguridad
//
//
//        if let token = loadKC(key: CONST_TOKEN_ID){
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
//
//        return request
//    }
    
    
}












