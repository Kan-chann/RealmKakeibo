//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by Kanno Taichi on 2024/09/16.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableView", bundle: nil),forCellReuseIdentifier: "ItemCell")
        items = readItems()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item : ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        return cell
    }
    
    func readItems()-> [ShoppingItem]{
        return Array(realm.objects(ShoppingItem.self))
    }


}

