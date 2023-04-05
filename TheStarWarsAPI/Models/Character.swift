//
//  Character.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String

    var description: String {
        return """
            height: \(height)
            mass: \(mass)
            hair color: \(hairColor)
            eye color: \(eyeColor)
            birth year: \(birthYear)
            gender: \(gender)
            """
    }
    
    init(characterData: [String: Any]) {
        name =  characterData["name"] as? String  ?? ""
        height =  characterData["height"] as? String  ?? ""
        mass =  characterData["mass"] as? String  ?? ""
        hairColor =  characterData["hair_color"] as? String  ?? ""
        eyeColor =  characterData["eye_color"] as? String  ?? ""
        birthYear =  characterData["birth_year"] as? String  ?? ""
        gender =  characterData["gender"] as? String  ?? ""
    }
    
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
    
    static func getCharacter(from value: Any) -> [Character] {
        guard let starWarsCharactersInfoData = value as? [String: Any] else { return [] } // получаем значения от API
        guard let charactersData = starWarsCharactersInfoData["results"] as? [[String: Any]] else { //  проваливаемся в словарь "result" и разворачиваем модель
            return []
        }
        return charactersData.map { Character(characterData: $0) } // перебираем модель
    }
}
