//  ViewController.swift
//  Concentration
//
//  Coding as done by Instructor CS193P Michel Deiman on 11/11/2017.
//  Copyright © 2017 Michel Deiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: self.cardButtons.count)
	var flipCount = 0 {didSet { flipCountLabel.text = "Flips: \(flipCount)"}}

	@IBOutlet weak var flipCountLabel: UILabel!
	@IBOutlet var cardButtons: [UIButton]!
	@IBAction func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardNumber = cardButtons.index(of: sender) {
			game.chooseACard(at: cardNumber)
            updateViewFromModel()
		} else {
			print("choosen card was not in cardButtons")
		}
	}
	
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) :#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "😈","👹","🍭","🍎","😂","🤷‍♂️"]
    var emojiDictionary = [Int:String]()
    
    func emoji(for card: Card) -> String{
        // initialize pair of card with the same emoji from a dictionary
        if emojiChoices.count > 0,
           emojiDictionary[card.identifer] == nil{
            let randIdx = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[randIdx] = emojiChoices.remove(at: randIdx)
        }
        return emojiDictionary[card.identifer] ?? "?"
    }
    

}
