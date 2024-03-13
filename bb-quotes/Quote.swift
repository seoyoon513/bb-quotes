//
//  Quote.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/13.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
