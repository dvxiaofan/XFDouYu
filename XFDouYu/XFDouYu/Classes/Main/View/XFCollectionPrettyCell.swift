//
//  XFCollectionPrettyCell.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFCollectionPrettyCell: XFCollectionBaseCell {

    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor: XFAnchorModel? {
        didSet {
            super.anchor = anchor
            
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
}
