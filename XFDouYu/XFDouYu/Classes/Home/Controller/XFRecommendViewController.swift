//
//  XFRecommendViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
fileprivate let kItemMargin: CGFloat = 6
fileprivate let kItemW: CGFloat = (kScreenW - 3 * kItemMargin) / 2
fileprivate let kNormalItemH: CGFloat = kItemW * 3 / 4
fileprivate let kPrettyItemH: CGFloat = kItemW * 4 / 3
fileprivate let kHeaderViewH: CGFloat = 35

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
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "XFCollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "XFCollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "XFCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,withReuseIdentifier: kHeaderViewID)
        
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
extension XFRecommendViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        // 定义 cell
        var cell : XFCollectionBaseCell!
        
        // 取出 cell
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! XFCollectionPrettyCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! XFCollectionNormalCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1. 取出 headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! XFCollectionHeaderView
        
        headerView.backgroundColor = UIColor.white
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNormalItemH)
    }
}

















