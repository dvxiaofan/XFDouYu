//
//  XFFunnyViewModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/14.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFFunnyViewModel: XFBaseViewModel {
    
}

extension XFFunnyViewModel {
    func loadFunnyData(finishedCallBack: @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: kHomeFunnyUrl, parameters: ["limit" : 0, "offset" : 0], finishedCallBack: finishedCallBack)
    }
}












