//
//  XFBaseAnchorVC.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/12.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kItemMargin : CGFloat = 6
private let kHeaderViewH: CGFloat = 40

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

let kPrettyCellID = "kPrettyCellID"
let kNormalItemW: CGFloat = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH: CGFloat = kNormalItemW * 3 / 4
let kPrettyItemH: CGFloat = kNormalItemW * 4 / 3

class XFBaseAnchorVC: UIViewController {
    
    // MARK:- 定义属性
    var baseVM: XFBaseViewModel!
    lazy var collectionView: UICollectionView = { [unowned self] in
        // 1. 创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
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
        
        setUpUI()
        
        loadData()
    }
}

// MARK:- 设置 UI
extension XFBaseAnchorVC {
    func setUpUI() {
        view.addSubview(collectionView)
    }
}

// MARK:- 请求数据
extension XFBaseAnchorVC {
    func loadData() {
        
    }
}

// MARK:- UICollectionViewDataSource UICollectionViewDelegate
extension XFBaseAnchorVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! XFCollectionNormalCell
        
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! XFCollectionHeaderView
        headerView.group = baseVM.anchorGroups[indexPath.section]
        
        return headerView
    }
}















