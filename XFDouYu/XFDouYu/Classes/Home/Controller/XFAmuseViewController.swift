//
//  XFAmuseViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit


class XFAmuseViewController: XFBaseAnchorVC {
    
    // MARK:- 懒加载属性
    fileprivate lazy var amuseVM: XFAmuseViewModel = XFAmuseViewModel()
}

// MARK:- 请求数据
extension XFAmuseViewController {
    override func loadData() {
        // 给不累 vm 赋值
        baseVM = amuseVM
        
        // 请求数据
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}






















