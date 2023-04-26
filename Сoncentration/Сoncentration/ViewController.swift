//
//  ViewController.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = СoncentrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        return  (buttonCollection.count + 1) / 2
    }
    
    private var emojiCollection = ["🦊","🐰","🐶","🐼","🦆","🐸","🦋","🐙","🐳","🦩","🦀","🐌","🐢","🦓","🦭","🦔","🐘","🐫","🦜", "🦚","🐿️"]
    private var emojiDictionary = [Int:String]()
    
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    @IBOutlet private var buttonCollection: [UIButton]!
    
    @IBOutlet private weak var touchLabel: UILabel!
    
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let index = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: index)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card =  game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifire(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.darkGray
            }
        }
    }
    
    private func emojiIdentifire(for card: Card) -> String {
        if emojiDictionary[card.identifire] == nil {
            emojiDictionary[card.identifire] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card.identifire] ?? ""
    }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
