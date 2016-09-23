//
//  XFRecommendViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
fileprivate let kItemMargin: CGFloat = 10
fileprivate let kItemW: CGFloat = (kScreenW - 3 * kItemMargin) / 2
fileprivate let kNormalItemH: CGFloat = kItemW * 3 / 4
fileprivate let kPrettyItemH: CGFloat = kItemW * 4 / 3
fileprivate let kHeaderViewH: CGFloat = 50

fileprivate let kNormalCellID = "kNormalCellID"
fileprivate let kPrettyCellID = "kPrettyCellID"
fileprivate let kHeaderViewID = "kHeaderViewID"

class XFRecommendViewController: UIViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = {
        // 1. 创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        // 2. 创建 colloectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        
        return collectionView
    }()
    
    // MARK:- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 UI
        setUpUI()
    }
}

// MARK:- 设置UI
extension XFRecommendViewController {
    fileprivate func setUpUI() {
        view.addSubview(collectionView)
    }
}



// MARK:- UICollectionViewDataSource
extension XFRecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.orange
        
        return cell
    }
}

















