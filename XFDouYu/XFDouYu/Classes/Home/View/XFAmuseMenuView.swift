//
//  XFAmuseMenuView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

private let kMenuCellID = "XFAmuseMenuViewCell"

class XFAmuseMenuView: UIView {
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- 从 nib 加载
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "XFAmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
    }
    
    // MARK:- 设置 layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

extension XFAmuseMenuView {
    class func amuseMenuView() -> XFAmuseMenuView {
        return Bundle.main.loadNibNamed("XFAmuseMenuView", owner: nil, options: nil)?.first as! XFAmuseMenuView
    }
}

extension XFAmuseMenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.xf_randomColor()
        
        return cell
    }
}



















