//
//  XFFunnyViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/14.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFFunnyViewController: XFBaseAnchorVC {
    // MARK:- 懒加载属性
    fileprivate lazy var funnyVM: XFFunnyViewModel = XFFunnyViewModel()
}

// MARK:- 重写 UI
extension XFFunnyViewController {
    override func setUpUI() {
        super.setUpUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
}

// MARK:- 加载数据
extension XFFunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            
            // 数据请求完成, 隐藏动画界面
            self.loadDataFinished()
        }
    }
}
















