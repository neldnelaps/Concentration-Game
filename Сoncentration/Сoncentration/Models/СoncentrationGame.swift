//
//  СoncentrationGame.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import Foundation

class СoncentrationGame {
    var cards = [Card]()
    var indexOfOneAndOnlyUoFaceCard : Int? // одна единственная перевернутая вверх карточка
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyUoFaceCard, matchingIndex != index {
                if cards[matchingIndex].identifire == cards[index].identifire { // карточки совпавшие
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyUoFaceCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyUoFaceCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
