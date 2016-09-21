//
//  XFMainViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/21.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyName: "XFHome")
        addChildVc(storyName: "XFLive")
        addChildVc(storyName: "XFFollow")
        addChildVc(storyName: "XFProfile")

    }

    private func addChildVc(storyName: String) {
        // 通过 storyboard 创建子控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        // 将 childVc 作为子控制器
        addChildViewController(childVc)
        
    }
}
