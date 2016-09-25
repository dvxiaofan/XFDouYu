//
//  XFRecommendViewModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFRecommendViewModel {
    // MARK:- 懒加载属性
    lazy var anchorGroups: [XFAnchorGroup] = [XFAnchorGroup]()
    lazy var cycleModel: [XFCycleModel] = [XFCycleModel]()
    
    fileprivate lazy var bigDataGroup: XFAnchorGroup = XFAnchorGroup()
    fileprivate lazy var pertyDataGroup: XFAnchorGroup = XFAnchorGroup()
}

// MARK:- 发送网络请求
extension XFRecommendViewModel {
    func requestData(_ finishedCallBack: @escaping () -> ()) {
        // 1. 定义参数
        let parameters = ["limit": "4", "offset": "0", "time": NSDate.xf_getCurrentDate()]
        
        // 2. 创建 group
        let disGroup = DispatchGroup()
        
        // 3. 请求第一部分数据
        disGroup.enter()
        
        XFNetworkTool.requestData(type: .GET, URLString: kHomeRecHotUrl, parameters: ["time": NSDate.xf_getCurrentDate()]) { (result) in
            
            // 1. 将result 转成字典模型
            guard let resultDic = result as? [String: NSObject] else { return }
            
            // 2.根据daga 该key, 获取数组
            guard let dataArray = resultDic["data"] as? [[String: NSObject]] else { return }
            
            // 3. 遍历字典, 并转成模型对象
            // 3.1 设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "columnHotIcon"
            
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = XFAnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            disGroup.leave()
        }
        
        // 4. 请求第二部分数据
        disGroup.enter()
        
        XFNetworkTool.requestData(type: .GET, URLString: kHomeRecYanUrl, parameters: parameters) { (result) in
            
            // 1. 将result 转成字典模型
            guard let resultDic = result as? [String: NSObject] else { return }
            
            // 2.根据daga 该key, 获取数组
            guard let dataArray = resultDic["data"] as? [[String: NSObject]] else { return }
            
            // 3. 遍历字典, 并转成模型对象
            // 3.1 设置组的属性
            self.pertyDataGroup.tag_name = "颜值"
            self.pertyDataGroup.icon_name = "columnYanzhiIcon"
            
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = XFAnchorModel(dict: dict)
                self.pertyDataGroup.anchors.append(anchor)
            }
            
            disGroup.leave()
        }
        
        // 5. 请求2-12部分游戏数据
        disGroup.enter()
        
        XFNetworkTool.requestData(type: .GET, URLString: KHomeRecOtheUrl, parameters: parameters) { (result) in
            
            // 1. 将result 转成字典模型
            guard let resultDic = result as? [String: NSObject] else { return }
            
            // 2.根据daga 该key, 获取数组
            guard let dataArray = resultDic["data"] as? [[String: NSObject]] else { return }
            
            // 3. 遍历字典, 并转成模型对象
            for dict in dataArray {
                let group = XFAnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            
            disGroup.leave()
        }
        
        // 6. 将所有请求到的数据进行排序
        disGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.pertyDataGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishedCallBack()
        }
    }
    
    // 加载头部循环数据
    func requestCycleData(_ finishedCallBack: @escaping () -> ()) {
        XFNetworkTool.requestData(type: .GET, URLString: kHomeRecCycleUrl, parameters: ["version" : "2.300"]) { (result) in
            
            guard let resultDic = result as? [String: NSObject] else { return }
            
            guard let dataArray = resultDic["data"] as? [[String: NSObject]] else { return }
            
            for dict in dataArray {
                self.cycleModel.append(XFCycleModel(dict: dict))
            }
            
            finishedCallBack()
        }
    }
}














