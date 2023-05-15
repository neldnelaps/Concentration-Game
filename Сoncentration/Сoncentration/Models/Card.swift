//
//  Card.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import Foundation

struct Card : Hashable {
    var isFaceUp = false // карточка лицом вверх
    var isMatched = false // карточка является совпавшей
    private var identifire : Int
    
    private static var identifireNumber = 0
    
    private static func identifireGenerator() -> Int {
        identifireNumber += 1
        return identifireNumber
    }
    
    init() {
        self.identifire = Card.identifireGenerator()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifire)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifire == rhs.identifire
    }
}
