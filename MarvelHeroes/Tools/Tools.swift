//
//  Tools.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 27/3/23.
//

import Foundation


func readCharacterJson(forName name: String) -> [Result] {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            let decodedData = try JSONDecoder().decode(DataClass.self, from: data)
            return decodedData.results
        }
    } catch {
        print("error: \(error)")
    }
    return []
}

func readSerieJson(forName name: String) -> [ResultSerie] {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            let decodedData = try JSONDecoder().decode(DataClassSerie.self, from: data)
            return decodedData.results
        }
    } catch {
        print("error: \(error)")
    }
    return []
}
