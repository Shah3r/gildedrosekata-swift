//
//  GildedRose.swift
//  GildedRoseKata
//
//  Created by Shaher Kassam on 08/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//


public class GildedRoseInventory {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        
//        let _ = items.map {  item in
//            categorize(item: item)
//        }
        
        _ = items.map{ categorize(item: $0) }
        
        
//        NormalInventory().update(items: items.filter({ $0.name == ItemName.elixir.rawValue || $0.name == ItemName.vest.rawValue}))
        
         }
    
    func categorize(item: Item) {

        switch item.name {
        // Normal
        case ItemName.elixir.rawValue, ItemName.vest.rawValue :
            NormalInventory().update(item: item)
        //Brie
        case ItemName.brie.rawValue :
            BrieInventory().update(item: item)
        //Pass
        case ItemName.pass.rawValue :
            PassInventory().update(item: item)
        // Legendary
        case ItemName.sulfuras.rawValue :
            LegendaryInventory().update(item: item)
        // Conjured
        case ItemName.cake.rawValue :
            ConjuredInventory().update(item: item)
        default:
            fatalError("Categorize: Item not in list")
        }
    }
}
