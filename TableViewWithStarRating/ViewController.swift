//
//  ViewController.swift
//  TableViewWithStarRating
//
//  Created by EthanLin on 2018/3/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var items = Items()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate, UITableViewDataSource, StarCollectionDidTappedDelegate{
    
    func starItemDidTapped(indexPath: IndexPath) {
//        switch indexPath.item {
//        case 1:
//            items.items[indexPath.row].starNumber = 1
//            
//        case 2:
//            items.items[indexPath.row].starNumber = 2
//            
//        case 3:
//            items.items[indexPath.row].starNumber = 3
//            
//        case 4:
//            items.items[indexPath.row].starNumber = 4
//           
//        case 5:
//            items.items[indexPath.row].starNumber = 5
//            
//        default:
//            items.items[indexPath.row].starNumber = 0
//            
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as! StarTableViewCell
        cell.index = indexPath
        cell.delegate = self
        cell.foodName.text = items.items[indexPath.row].name
        return  cell
    }
}
