//
//  XFCollectionCycleCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit
import Kingfisher

class XFCollectionCycleCell: UICollectionViewCell {
    
    // MARK:- 拖线属性
    @IBOutlet weak var iconImageView: UIImageView!
    
    var cycleModel: XFCycleModel? {
        didSet {
            let iconURL = URL(string: cycleModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    

}
