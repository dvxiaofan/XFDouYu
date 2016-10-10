//
//  XFGameViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kEdeMargin: CGFloat = 10
private let kItemW: CGFloat = (kScreenW - 2 * kEdeMargin) / 3
private let kItemH: CGFloat = kItemW * 6 / 5
private let kHeaderViewH: CGFloat = 50

private let kGameCellID = "kGameCellID"
private let kHeaderViewID = "kHeaderViewID"

class XFGameViewController: UIViewController {
    
    // MARK:- 懒加载
    fileprivate lazy var gameVM: XFGameViewModel = XFGameViewModel()
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        // 1. 创建 layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdeMargin, bottom: 0, right: kEdeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        // 2. 创建 collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
        collectionView.register(UINib(nibName: "XFRecommendGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "XFCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,withReuseIdentifier: kHeaderViewID)
        collectionView.dataSource = self
        
        // 3. 返回
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
extension XFGameViewController {
    fileprivate func setUpUI() {
        view.addSubview(collectionView)
    }
}

// MARK:- 请求数据
extension XFGameViewController {
    fileprivate func loadData() {
        gameVM.loadAllGameData {
            self.collectionView.reloadData()
        }
    }
}

// MARK:- UICollectionViewDataSource
extension XFGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! XFRecommendGameCell
        cell.baseGame = gameVM.games[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! XFCollectionHeaderView
        headerView.headerNameLabel.text = "全部"
        headerView.headerIconView.image = UIImage(named: "Img_orange")
        headerView.moreBtn.isHidden = true 
        
        return headerView
    }
}

















