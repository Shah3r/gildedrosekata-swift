//
//  MainViewController.swift
//  GildedRoseKata
//
//  Created by Shaher Kassam on 08/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainTableView: UITableView!
    var detailView: DetailViewController?
    
    private var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableview
        mainTableView.tableFooterView = UIView()
        mainTableView.rowHeight = UITableView.automaticDimension
        
        // TODO: Navigation to move to a Controller
        detailView = (UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! DetailViewController)
        
        self.main()
    }
    
    //MARK: Text Test
    func main() {
        
        items = [
            //Normal
            Item(name: ItemName.vest.rawValue, sellIn: 10, quality: 20),
            Item(name: ItemName.elixir.rawValue, sellIn: 5, quality: 7),
            
            // Inversed
            Item(name: ItemName.brie.rawValue, sellIn: 2, quality: 0),
            Item(name: ItemName.pass.rawValue, sellIn: 15, quality: 20),
            Item(name: ItemName.pass.rawValue, sellIn: 10, quality: 49),
            Item(name: ItemName.pass.rawValue, sellIn: 5, quality: 49),
            
            //Legendary
            Item(name: ItemName.sulfuras.rawValue, sellIn: 0, quality: 80),
            Item(name: ItemName.sulfuras.rawValue, sellIn: -1, quality: 80),
            
            //Conjured
            Item(name: ItemName.cake.rawValue, sellIn: 3, quality: 6)]
        
        let app = GildedRoseInventory(items: items)
        
        var days = 11
        
        if (CommandLine.argc > 1) {
            if let newDays = Int(CommandLine.arguments[1]) {
                days = newDays + 1
            }
        }
        
        for day in 0..<days {
            app.printItem(day)
            app.updateQuality()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentItem = items[indexPath.row]
        
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = "(\(currentItem.sellIn),\(currentItem.quality))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return "Kata"
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentItem = items[indexPath.row]
 
        if let dv = detailView {
            dv.item = currentItem
            self.navigationController?.pushViewController(dv, animated: true)
        }
    }
}
