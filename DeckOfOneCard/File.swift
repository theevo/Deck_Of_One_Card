//
//  File.swift
//  DeckOfOneCard
//
//  Created by theevo on 3/10/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

struct Card: Decodable {
    let image: URL
    let value: String
    let suit: String // enum?
}

struct TopLevelObject: Decodable {
    let cards: [Card]
}
