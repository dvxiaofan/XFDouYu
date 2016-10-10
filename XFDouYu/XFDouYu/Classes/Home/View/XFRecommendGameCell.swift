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
    var baseGame: XFBaseGameModel? {
        didSet {
            nameLabel.text = baseGame?.tag_name
            
            if let iconURL = URL(string: baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }
}
