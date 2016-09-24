//
//  XFAnchorModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFAnchorModel: NSObject {
    
    var room_id: Int = 0
    
    var vertical_src: String = ""
    
    /// 判断是手机直播还是电脑直播 0 : 电脑直播 1 : 手机直播
    var isVertical: Int = 0
    
    var room_name: String = ""
    var nickname: String = ""
    var online: Float = 0
    var anchor_city: String = ""
    
    init(dict: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}












