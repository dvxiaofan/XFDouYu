//
//  XFCycleModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCycleModel: NSObject {
    // 标题
    var title: String = ""
    // 展示图片的 URL
    var pid_url: String = ""
    // 主播信息对应模型字典
    var room: [String: NSObject]? {
        didSet {
            guard let room = room else { return }
            
            anchor = XFAnchorModel(dict: room)
        }
    }
    
    // 主播信息对应模型对象
    var anchor: XFAnchorModel?
    
    // MARK:- 自定义构造函数
    init(dict: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}

















