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
        
        guard let systemGes = interactivePopGestureRecognizer else { return }
        
        guard let gesView = systemGes.view else { return }
        
        // 利用运行时机制查看所有属性名称
//        var count: UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            XFLog(String(cString: name!))
//        }
        let targets = systemGes.value(forKey: "_targets") as! [NSObject]
        guard let targerObjc = targets.first else { return }
        
        // 取出 target
        guard let target = targerObjc.value(forKey: "target") else { return }
        
        // 取出 action
        let action = Selector(("handleNavigationTransition:"))
        
        // 创建自己的 pan 手势
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 隐藏要push 的控制器的 tabbar
        viewController.hidesBottomBarWhenPushed = true
        
        super.pushViewController(viewController, animated: animated)
    }
}













