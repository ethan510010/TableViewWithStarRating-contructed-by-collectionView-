//
//  Item.swift
//  TableViewWithStarRating
//
//  Created by EthanLin on 2018/3/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation

class Items {
    var items = [Item(name: "food1", starNumber: 0), Item(name: "food2", starNumber: 0), Item(name: "food3", starNumber: 0), Item(name: "food4", starNumber: 0),Item(name: "food5", starNumber: 0) ]
}

class Item {
    var name:String
    var starNumber:Int
    init(name:String,starNumber:Int) {
        self.name = name
        self.starNumber = starNumber
    }
}
