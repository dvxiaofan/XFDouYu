//
//  XFCollectionNormalCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCollectionNormalCell: XFCollectionBaseCell {

    // MARK:- 拖线属性
    @IBOutlet weak var roomDescriLabl: UILabel!
    
    // MARK:- 定义模型属性
    override var anchor: XFAnchorModel? {
        didSet {
            super.anchor = anchor
            
            // 房号名字
            roomDescriLabl.text = anchor?.room_name
        }
    }

}
