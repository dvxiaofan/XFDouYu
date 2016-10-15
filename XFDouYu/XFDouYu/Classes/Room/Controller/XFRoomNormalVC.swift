//
//  XFRoomNormalVC.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/15.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFRoomNormalVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        // 保持返回手势
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}


















