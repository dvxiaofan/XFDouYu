//
//  XFRecommendViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
fileprivate let kItemMargin : CGFloat = 6
fileprivate let kItemW      : CGFloat = (kScreenW - 3 * kItemMargin) / 2
fileprivate let kNormalItemH: CGFloat = kItemW * 3 / 4
fileprivate let kPrettyItemH: CGFloat = kItemW * 4 / 3
fileprivate let kHeaderViewH: CGFloat = 35

fileprivate let kCycleViewH : CGFloat = kScreenW * 3 / 8
fileprivate let kGameViewH  : CGFloat = 90

fileprivate let kNormalCellID = "kNormalCellID"
fileprivate let kPrettyCellID = "kPrettyCellID"
fileprivate let kHeaderViewID = "kHeaderViewID"

class XFRecommendViewController: UIViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var recommentVM: XFRecommendViewModel = XFRecommendViewModel()
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
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
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
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
        
        // 请求数据
        loadData()
    }
}

// MARK:- 设置UI
extension XFRecommendViewController {
    fileprivate func setUpUI() {
        
        view.addSubview(collectionView)
        
        
        // 设置 collectionview 内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK:- 请求数据
extension XFRecommendViewController {
    fileprivate func loadData() {
        // 请求推荐数据
        recommentVM.requestData {
            // 1. 展示推荐数据
            self.collectionView.reloadData()
            
        }
    }
}

// MARK:- UICollectionViewDataSource
extension XFRecommendViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommentVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let group = recommentVM.anchorGroups[section]
        
        return group.anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 取出数据
        let group = recommentVM.anchorGroups[indexPath.section]
        let anchor = group.anchors[indexPath.item]
        
        // 定义 cell
        var cell : XFCollectionBaseCell!
        
        // 取出 cell
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! XFCollectionPrettyCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! XFCollectionNormalCell
        }
        
        // 将模型赋给 cell
        cell.anchor = anchor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1. 取出 headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! XFCollectionHeaderView
        
        headerView.group = recommentVM.anchorGroups[indexPath.section]
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNormalItemH)
    }
}

















