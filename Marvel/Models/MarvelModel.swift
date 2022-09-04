//
//  MarvelModel.swift
//  Marvel
//
//  Created by Kadır  Yıldız on 31.08.2022.
//
//

import Foundation

struct APIResult: Codable{
    var data: APICharacterData
}

struct APICharacterData: Codable {
    var results: [Character]
}

struct Character: Codable {
    var name: String
    var modified: String
    var thumbnail: [String:String]

}




