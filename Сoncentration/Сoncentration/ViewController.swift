//
//  ViewController.swift
//  Сoncentration
//
//  Created by Natalia Pashkova on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = СoncentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var emojiCollection = ["🦊","🐰","🐶","🐼", "🦆", "🐸","🦋","🐙", "🐳", "🦩"]
    var emojiDictionary = [Int:String]()
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touchLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let index = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: index)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
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
    
    func emojiIdentifire(for card: Card) -> String {
        if emojiDictionary[card.identifire] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifire] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifire] ?? ""
    }
    
}

