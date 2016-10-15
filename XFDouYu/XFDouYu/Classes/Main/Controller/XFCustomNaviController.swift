//
//  XFCustomNaviController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/15.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCustomNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 隐藏要push 的控制器的 tabbar
        viewController.hidesBottomBarWhenPushed = true
        
        super.pushViewController(viewController, animated: animated)
    }
}













