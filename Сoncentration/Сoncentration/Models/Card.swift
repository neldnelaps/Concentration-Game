//
//  Card.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import Foundation

struct Card {
    var isFaceUp = false // карточка лицом вверх
    var isMatched = false // карточка является совпавшей
    var identifire : Int
    
    static var identifireNumber = 0
    
    static func identifireGenerator() -> Int {
        identifireNumber += 1
        return identifireNumber
    }
    
    init() {
        self.identifire = Card.identifireGenerator()
    }
}
