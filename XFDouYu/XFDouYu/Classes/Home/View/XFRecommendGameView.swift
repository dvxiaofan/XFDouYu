//
//  XFRecommendGameView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
fileprivate let kGameCellID = "kGameCellID"
fileprivate let kEdgeInsetMargin : CGFloat = 10

class XFRecommendGameView: UIView {
    
    // MARK:- 定义属性
    var groups: [XFAnchorGroup]? {
        didSet {
            // 移除前两组数据
            groups?.removeFirst()
            groups?.removeFirst()
            
            // 添加更多组
            let moreGroup = XFAnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            // 刷新表格
            collectionView.reloadData()
        }
    }
    
    // MARK:- 拖线属性
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UINib(nibName: "XFRecommendGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
}

// MARK:-  提供一个通过 xib 快速创建的类方法
extension XFRecommendGameView {
    class func recommentGameView() -> XFRecommendGameView {
        return Bundle.main.loadNibNamed("XFRecommendGameView", owner: nil, options: nil)?.first as! XFRecommendGameView
    }
}

// MARK:- UICollectionViewDataSource
extension XFRecommendGameView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! XFRecommendGameCell
        
        cell.group = groups?[(indexPath as NSIndexPath).item]
        
        return cell 
    }
}













