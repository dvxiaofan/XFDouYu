//
//  XFAmuseMenuViewCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 常量
private let kGameCellID = "kGameCellID"

class XFAmuseMenuViewCell: UICollectionViewCell {
    
    var groups: [XFAnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    

    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK:- 从 xib 加载
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "XFRecommendGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }
    
    // MARK:- layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }

}

// MARK:- UICollectionViewDataSource
extension XFAmuseMenuViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! XFRecommendGameCell
        cell.baseGame = groups![indexPath.item]
        
        
        return cell
    }
}












