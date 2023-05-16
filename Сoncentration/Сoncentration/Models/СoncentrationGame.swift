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
            return cards.indices.filter{ cards[$0].isFaceUp }.oneAndOnly // проходим по всем индексам и фильтруем все перевернутые вверх карточки. Если там одна перевернутая карточка, то возвращаем ее индекс иначе nil
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

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
