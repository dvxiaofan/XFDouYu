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

    
    // MARK:- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}


















