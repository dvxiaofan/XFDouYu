//
//  XFAmuseMenuView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFAmuseMenuView: UIView {
    
}

extension XFAmuseMenuView {
    class func amuseMenuView() -> XFAmuseMenuView {
        return Bundle.main.loadNibNamed("XFAmuseMenuView", owner: nil, options: nil)?.first as! XFAmuseMenuView
    }
}



















