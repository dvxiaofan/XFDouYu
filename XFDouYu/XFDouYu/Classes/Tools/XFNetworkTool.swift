//
//  XFNetworkTool.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit
import Alamofire


enum MethodType {
    case GET
    case POST
}

class XFNetworkTool {
    class func requestData(type: MethodType, URLString: String, parameters: [String : Any]? = nil, finishedCallBack: @escaping (_ result: AnyObject) -> ()) {
        // 1. 获取请求类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        // 2. 发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let result = response.result.value else {
                XFLog(response.result.error)
                return
            }
            
            // 3. 讲结果返回
            finishedCallBack(result as AnyObject)
        }
        
    }
}







