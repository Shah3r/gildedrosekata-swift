//
//  PassItemTests.swift
//  GildedRoseKataTests
//
//  Created by Shaher Kassam on 09/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//

@testable import GildedRoseKata
import XCTest

class PassItemTests: XCTestCase {

    //MARK: Pass
    func testPassItem() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: 15, quality: 20)]
        let app = GildedRoseInventory(items: items)
        //when
            app.updateQuality()
        //then
        XCTAssertEqual(14, app.items[0].sellIn)
        XCTAssertEqual(21, app.items[0].quality)
    }
    
    func testPassItemDouble() {
        //given
        let items = [ Item(name: ItemName.pass.rawValue, sellIn: 10, quality: 20)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(9, app.items[0].sellIn)
        XCTAssertEqual(22, app.items[0].quality)
    }
    
    func testPassItemTriple() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: 5, quality: 20)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(4, app.items[0].sellIn)
        XCTAssertEqual(23, app.items[0].quality)
    }
    
    func testPassItemDoubleEdge() {
        //given
        let items = [ Item(name: ItemName.pass.rawValue, sellIn: 10, quality: 49)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(9, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testPassItemTripleEdge() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: 5, quality: 49)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(4, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testPassItemAfterSellIn() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: -1, quality: 49)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(-2, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }
    
    func testPassItemOnSellIn() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: 0, quality: 20)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }
    
    func testPassItemMax() {
        //given
        let items = [Item(name: ItemName.pass.rawValue, sellIn: 0, quality: 50)]
        let app = GildedRoseInventory(items: items)
        //when
        app.updateQuality()
        //then
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }
    
}
