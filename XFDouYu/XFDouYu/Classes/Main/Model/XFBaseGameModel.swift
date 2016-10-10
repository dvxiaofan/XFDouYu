//
//  XFBaseGameModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFBaseGameModel: NSObject {
    // MARK:- 属性
    var tag_name: String = ""
    var icon_url: String = ""
    
    // MARK:- 自定义构造函数
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) { }
    
    
}

















