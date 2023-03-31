//
//  Tools.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 27/3/23.
//

import Foundation


enum mockFilesData: String {
    case characters = "CharactersData"
    case series = "SeriesData"
}

struct vmError {
    var status = false
    var description = ""
}

//enum DataModel {
//    case character
//    case series
//
//    var model: Decodable.Type {
//        switch self {
//        case .character:
//            return ResultCharacter.self
//        case .series:
//            return ResultSeries.self
//        }
//    }
//}

//func parseJson<T: Decodable>(filename: String, type: T.Type) -> T? {
//    if let filePath = Bundle.main.path(forResource: filename, ofType: "json") {
//        do {
//            let fileUrl = URL(fileURLWithPath: filePath)
//            let data = try Data(contentsOf: fileUrl)
//            let decodedData = try JSONDecoder().decode(T.self, from: data)
//            return decodedData
//        } catch {
//            print("Error parsing JSON: \(error.localizedDescription)")
//            return nil
//        }
//    } else {
//        print("File not found")
//        return nil
//    }
//}

func readData(filename: String) -> Data {
    if let filePath = Bundle.main.path(forResource: filename, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            print("Error reading data: \(error.localizedDescription)")
            return Data()
        }
    } else {
        print("File not found")
        return Data()
    }
}
