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
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = XFPageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var pageContentView: XFPageContentView = {[weak self] in
        // 1. 确定内容 frame
        let contentH = kScreenH - kStatusBarH - kNavBarH - kTabBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH + kTitleViewH, width: kScreenW, height: contentH)
        // 2. 确定所有控制器
        var childVcs = [UIViewController]()
        childVcs.append(XFRecommendViewController())
        childVcs.append(XFGameViewController())
        for _ in 0..<2 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.xf_randomColor()
            childVcs.append(vc)
        }
        
        let contentView = XFPageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        contentView.delegate = self
        return contentView
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
        
        // 3. 添加 contentview
        view.addSubview(pageContentView)
    }
    
    fileprivate func setUpNavBar() {
        // 左边 item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "homeLogoIcon")
        
        // 右边 item
        let size = CGSize(width: 40, height: 40)
        
        let searchItem = UIBarButtonItem(imageName: "searchIcon", highlightImgName: "searchIconHL", size: size)
        let ercodeItem = UIBarButtonItem(imageName: "scanIcon", highlightImgName: "scanIconHL", size: size)
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", highlightImgName: "viewHistoryIconHL", size: size)
        
        navigationItem.rightBarButtonItems = [searchItem, ercodeItem, historyItem]
    }
}

// MARK:- pageTitleViewDelegate
extension XFHomeViewController: XFPageTitleViewDelegate {
    func pageTitleView(pageTitleView: XFPageTitleView, didSelectedIndex index: Int) {
        pageContentView.scrollToIndex(index: index)
    }
}

// MARK:- pageContentViewDelegate
extension XFHomeViewController: XFPageContentViewDelegate {
    func pageContentView(pageContentView: XFPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgerss(sourceIndex: sourceIndex, targetIndex: targetIndex, progress: progress)
    }
}













