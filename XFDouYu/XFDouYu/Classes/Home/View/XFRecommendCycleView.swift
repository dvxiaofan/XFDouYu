//
//  XFRecommendCycleView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量

fileprivate let kCycleCellID = "kCycleCellID"

class XFRecommendCycleView: UIView {
    
    
    // MARK:- 拖线属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置不能自动拉伸
        autoresizingMask = UIViewAutoresizing()
        
        // 注册 cell
        collectionView.register(UINib(), forCellWithReuseIdentifier: kCycleCellID)
//        let nib = UINib(nibName: , bundle: <#T##Bundle?#>)
    }

    
    
}
















