//
//  СoncentrationGame.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import Foundation

class СoncentrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyUoFaceCard : Int? {// одна единственная перевернутая вверх карточка
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        foundIndex = nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyUoFaceCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] { // карточки совпавшие
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyUoFaceCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "СoncentrationGame.init(\(numberOfPairsOfCards): must have one pair of cards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
