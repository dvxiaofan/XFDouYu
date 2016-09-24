//
//  XFCollectionBaseCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCollectionBaseCell: UICollectionViewCell {
    
    // MARK:- 拖线属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    
    // MARK:- 定义属性
    var anchor: XFAnchorModel? {
        didSet {
            guard let anchor = anchor else { return }
            
            // 取出在线人数显示的文字
            var onlineStr: String = ""
            if anchor.onlie >= 10000 {
                onlineStr = "\(Int(anchor.onlie / 10000))万"
            } else {
                onlineStr = "\(anchor.onlie)"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            // 昵称
            nickNameLabel.text = anchor.nickname
            
            // 封面图片
//            guard let iconURL = NSURL(string: anchor.vertical_src) else { return }
            
        }
    }
}











