//
//  StarTableViewCell.swift
//  TableViewWithStarRating
//
//  Created by EthanLin on 2018/3/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var foodName: UILabel!
    
    
    var items = Items()
    
    @IBOutlet weak var starCollectionView: UICollectionView!
    
    var index:IndexPath!
    var delegate:StarCollectionDidTappedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starCollectionView.delegate = self
        starCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol StarCollectionDidTappedDelegate{
    func starItemDidTapped(indexPath:IndexPath)
}

extension StarTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "star", for: indexPath) as! StarCollectionViewCell
        cell.starImage.image = UIImage(named: "starGray")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.starItemDidTapped(indexPath: index)
        
        switch indexPath.item {
        case 0:
            items.items[index.row].starNumber = 1
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        case 1:
            items.items[index.row].starNumber = 2
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        case 2:
            items.items[index.row].starNumber = 3
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        case 3:
            items.items[index.row].starNumber = 4
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        case 4:
            items.items[index.row].starNumber = 5
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        default:
            items.items[index.row].starNumber = 0
            print(items.items[index.row].name)
            print(items.items[index.row].starNumber)
        }
//        delegate?.starItemDidTapped(indexPath: index)
        collectionView.reloadData()
    }
    
}
