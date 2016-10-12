//
//  XFCollectionHeaderView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCollectionHeaderView: UICollectionReusableView {
    // MARK:- 拖线属性
    @IBOutlet weak var headerIconView: UIImageView!
    @IBOutlet weak var headerNameLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    // MARK:- 定义模型属性
    var group: XFAnchorGroup? {
        didSet {
            headerIconView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
            headerNameLabel.text = group?.tag_name
        }
    }
}

// MARK:- 从 nib 快速创建 view
extension XFCollectionHeaderView {
    class func collectionHeaderView() -> XFCollectionHeaderView {
        return Bundle.main.loadNibNamed("XFCollectionHeaderView", owner: nil, options: nil)?.first as! XFCollectionHeaderView
    }
}









