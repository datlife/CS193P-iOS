//
//  Card.swift
//  Concentration
//
//  Created by Dat on 10/20/18.
//  Copyright © 2018 Michel Deiman. All rights reserved.
//

import Foundation

// We define Card model, or how Card should behave
// This Card Model should not contain any emoji, which would be
// handle by the View (UI).
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifer: Int
    
    static var identiferFactory  = 0
    static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }
    init(){  // init can have same external/internal name
        self.identifer = Card.getUniqueIdentifier()
    }
}
