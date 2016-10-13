//
//  XFAmuseViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

private let kMenuViewH: CGFloat = 200

class XFAmuseViewController: XFBaseAnchorVC {
    
    // MARK:- 懒加载属性
    fileprivate lazy var amuseVM: XFAmuseViewModel = XFAmuseViewModel()
    fileprivate lazy var menuView: XFAmuseMenuView = {
        let menuView = XFAmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        
        
        
        return menuView
    }()
}

// MARK:- 设置 UI
extension XFAmuseViewController {
    override func setUpUI() {
        super.setUpUI()
        
        collectionView.addSubview(menuView)
        
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
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






















