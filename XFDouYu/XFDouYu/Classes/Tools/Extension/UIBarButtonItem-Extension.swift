//
//  UIBarButtonItem-Extension.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 便利构造函数
    convenience init(imageName: String, highlightImgName: String = "", size: CGSize = CGSize.zero) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highlightImgName != "" {
            btn.setImage(UIImage(named: highlightImgName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
