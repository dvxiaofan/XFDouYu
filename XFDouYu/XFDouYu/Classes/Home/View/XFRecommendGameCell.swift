//
//  XFRecommendGameCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit
import Kingfisher

class XFRecommendGameCell: UICollectionViewCell {
    
    // MARK:- 拖线属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK:- 定义模型属性
    var group: XFAnchorGroup? {
        didSet {
            nameLabel.text = group?.tag_name
            let iconURL = URL(string: group?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
