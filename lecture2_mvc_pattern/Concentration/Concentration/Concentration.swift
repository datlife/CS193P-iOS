//
//  Concentration.swift
//  Concentration
//
//  Created by Dat on 10/20/18.
//  Copyright © 2018 Michel Deiman. All rights reserved.
//

import Foundation
import UIKit

class Concentration{
    var cards = [Card]()
    var indexOfOneAndOnlyFacedUp: Int?
    
    func chooseACard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{ // countable range notation
            let card = Card()
            cards += [card, card] // a pair of card that has the same emoji
        }
        // TODO: Shuffle the cards
    }
}
