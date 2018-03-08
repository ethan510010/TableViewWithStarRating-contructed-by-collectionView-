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
    
    
    var starsCase0 = ["starGray","starGray","starGray","starGray","starGray"]
    var starsCase1 = ["starOrange","starGray","starGray","starGray","starGray"]
    var starsCase2 = ["starOrange","starOrange","starGray","starGray","starGray"]
    var starsCase3 = ["starOrange","starOrange","starOrange","starGray","starGray"]
    var starsCase4 = ["starOrange","starOrange","starOrange","starOrange","starGray"]
    var starsCase5 = ["starOrange","starOrange","starOrange","starOrange","starOrange"]
    
    var items = Items()
    
    @IBOutlet weak var starCollectionView: UICollectionView!
    
    //此index得到的是TableView的index
    var index:IndexPath!
    var delegate:StarCollectionDidTappedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starCollectionView.delegate = self
        starCollectionView.dataSource = self
        
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
        
        
        switch items.items[index.row].starNumber {
        case 1:
            cell.starImage.image = UIImage(named: starsCase1[indexPath.item])
        case 2:
            cell.starImage.image = UIImage(named: starsCase2[indexPath.item])
        case 3:
            cell.starImage.image = UIImage(named: starsCase3[indexPath.item])
        case 4:
            cell.starImage.image = UIImage(named: starsCase4[indexPath.item])
        case 5:
            cell.starImage.image = UIImage(named: starsCase5[indexPath.item])
        default:
            cell.starImage.image = UIImage(named: starsCase0[indexPath.item])
        }

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
        collectionView.reloadData()
    }
    
}
