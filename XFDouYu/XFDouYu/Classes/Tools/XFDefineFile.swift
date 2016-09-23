//
//  XFDefineFile.swift
//
//  Created by xiaofans on 16/8/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
// 需要在 buildsetting - custom flags - other Swift flags - Debug 添加 any archi  --   -D DEBUG
//

import UIKit

// 自定义输出
func XFLog<T>(_ message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]-> \(message)")
        
    #endif
}


let kStatusBarH: CGFloat = 20
let kNavBarH: CGFloat = 44
let kTabBarH: CGFloat = 44

// 屏幕
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

func isiPhone5() ->Bool {
    if kScreenH == 568 {
        return true
    }
    return false
}

func isiPhone6_6s() -> Bool {
    if kScreenH == 667 {
        return true
    }
    return false
}

func isiPhone6P_6SP() -> Bool {
    if kScreenH == 736 {
        return true
    }
    return false
}

// 版本
let iOS8 : Float = 8.0

func isiOS8() ->Bool {
    let version = UIDevice.current.systemVersion as NSString
    if version.floatValue >= iOS8 {
        return true
    }
    return false
}
















