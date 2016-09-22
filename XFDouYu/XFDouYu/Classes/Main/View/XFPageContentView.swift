//
//  XFPageContentView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

fileprivate let XFContentCellID = "XFContentCellID"

class XFPageContentView: UIView {
    
    // MARK:- 定义属性
    fileprivate var childVcs: [UIViewController]
    fileprivate var parentVc: UIViewController
    
    // MARK:- 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = {
        // 1. 创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        // 2. 创建 collectionView
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: XFContentCellID)
        
        return collectionView
    }()

    // MARK:- 自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentVc: UIViewController) {
        self.childVcs = childVcs
        self.parentVc = parentVc
        
        super.init(frame: frame)
        
        // 设置 UI
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置 UI 界面
extension XFPageContentView {
    fileprivate func setUpUI() {
        // 1. 将所有子控制器添加到父控制器中
        for childVc in childVcs {
            parentVc.addChildViewController(childVc)
        }
        
        // 2. 添加 collectionview, 用于显示信息
        addSubview(collectionView)
        collectionView.frame = bounds
        
    }
}

// MARK:- UICollectionViewDataSource
extension XFPageContentView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1. 创建 cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XFContentCellID, for: indexPath)
        
        // 2. 设置 cell 数据
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

// MARK:- UICollectionViewDelegate
extension XFPageContentView: UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
}

// MARK:- 对外暴露方法
extension XFPageContentView {
    func scrollToIndex(index: Int) {
        let offset = CGPoint(x: CGFloat(index) * collectionView.bounds.width, y: 0)
        collectionView.setContentOffset(offset, animated: false)
    }
}













