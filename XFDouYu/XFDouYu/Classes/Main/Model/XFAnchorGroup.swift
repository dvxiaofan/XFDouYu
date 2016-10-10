//
//  XFAnchorGroup.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFAnchorGroup: XFBaseGameModel {
    // 该组中对应的房间信息
    var room_list: [[String: NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            
            for dict in room_list {
                anchors.append(XFAnchorModel(dict: dict))
            }
        }
    }
    // 组显示的图标
    var icon_name : String = "home_header_normal"
    
    // 定义主播的模型对象数组
    lazy var anchors : [XFAnchorModel] = [XFAnchorModel]()
}
















