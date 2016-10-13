//
//  XFAmuseViewModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFAmuseViewModel: XFBaseViewModel {
    
}

extension XFAmuseViewModel {
    func loadAmuseData(finishedCallBack: @escaping () -> ()) {
        loadAnchorData(URLString: kHomeAmuseUrl, finishedCallBack: finishedCallBack)
    }
}




















