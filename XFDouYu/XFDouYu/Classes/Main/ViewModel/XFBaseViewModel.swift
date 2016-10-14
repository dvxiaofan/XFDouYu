//
//  XFBaseViewModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/12.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFBaseViewModel {
    lazy var anchorGroups: [XFAnchorGroup] = [XFAnchorGroup]()
}

extension XFBaseViewModel {
    func loadAnchorData(isGroupData: Bool, URLString: String, parameters: [String : Any]? = nil, finishedCallBack: @escaping () -> ()) {
        XFNetworkTool.requestData(type: .GET, URLString: URLString, parameters: parameters) { (result) in
            // 对数据进行处理
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            if isGroupData {
                // 遍历数组中的字典
                for dict in dataArray {
                    self.anchorGroups.append(XFAnchorGroup(dict: dict))
                }
            } else {
                let group = XFAnchorGroup()
                
                for dict in dataArray {
                    group.anchors.append(XFAnchorModel(dict: dict))
                }
                
                self.anchorGroups.append(group)
            }
            
            // 完成回调
            finishedCallBack()
        }
    }
}





















