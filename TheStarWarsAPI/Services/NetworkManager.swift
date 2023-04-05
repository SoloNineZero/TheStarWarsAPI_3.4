//
//  NetworkManager.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 24.03.2023.
//

import Foundation
import Alamofire

enum Link {
    case apiCharacterURL
    
    var url: URL {
        switch self {
        case .apiCharacterURL:
            return URL(string: "https://swapi.dev/api/people/")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decoding
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
 
    func fetchCharacters(from url: URL, completion: @escaping(Result<[Character], AFError>) -> Void) {
        AF.request(url) // обращаемся к API по ссылке
            .validate() // проверяем что есть данные (200-299 код)
            .responseJSON { dataResponse in // ручной парсинг
                switch dataResponse.result {
                case .success(let value):
                    let characters = StarWarsCharactersInfo.getCharacter(from: value)
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

