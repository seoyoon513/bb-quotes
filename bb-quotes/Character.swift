//
//  Character.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/13.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL] // automatically convert it to url for us
    let aliases: [String]
    let protrayedBy: String
}
