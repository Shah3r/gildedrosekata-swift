//
//  PassInventory.swift
//  GildedRoseKata
//
//  Created by Shaher Kassam on 10/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//

import Foundation

class PassInventory: Updatable {
    
    func updateBeforeSellIn(item: Item) {
        
        if item.sellIn <= QualitySettings.triple.rawValue {
            qualityUp(item: item, ratio: 3)
        } else if item.sellIn <= QualitySettings.double.rawValue {
            qualityUp(item: item, ratio: 2)
        } else {
            qualityUp(item: item, ratio: 1)
        }
    }
    
    func updateAfterSellIn(item: Item) {
        qualityNil(item: item)
    }
    
}
