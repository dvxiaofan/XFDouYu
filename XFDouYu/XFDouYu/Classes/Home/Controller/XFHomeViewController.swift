//
//  XFHomeViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/21.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit


fileprivate let kTitleViewH : CGFloat = 40

class XFHomeViewController: UIViewController {
    
    // MARK:- 懒加载
    fileprivate lazy var pageTitleView: XFPageTitleView = {
        let titleFrame = CGRect(x: 0, y: 64, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = XFPageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()

    // MARK:- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 UI 界面
        setUpUI()
    }
}

// MARK:- 设置 UI
extension XFHomeViewController {
    fileprivate func setUpUI() {
        // 0. 不允许系统调整 scrollview 内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1. 设置导航栏
        setUpNavBar()
        
        // 2. 添加 titleview
        view.addSubview(pageTitleView)
    }
    
    fileprivate func setUpNavBar() {
        // 左边 item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 右边 item
        let size = CGSize(width: 40, height: 40)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highlightImgName: "btn_search_clicked", size: size)
        let ercodeItem = UIBarButtonItem(imageName: "Image_scan", highlightImgName: "Image_scan_click", size: size)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highlightImgName: "Image_my_history_click", size: size)
        
        navigationItem.rightBarButtonItems = [searchItem, ercodeItem, historyItem]
    }
}















