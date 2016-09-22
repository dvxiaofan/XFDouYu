//
//  XFHomeViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/21.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 UI 界面
        setUpUI()
    }
}

// MARK:- 设置 UI
extension XFHomeViewController {
    fileprivate func setUpUI() {
        // 设置导航栏
        setUpNavBar()
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















