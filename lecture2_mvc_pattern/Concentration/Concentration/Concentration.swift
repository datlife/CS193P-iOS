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
    var currentFacedUpCardIndex: Int?
    
    func chooseACard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = currentFacedUpCardIndex, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                currentFacedUpCardIndex = nil    // not one and only ...
            } else {
                // either no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                currentFacedUpCardIndex = index
            }
            
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
