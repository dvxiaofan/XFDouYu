//
//  XFGameViewModel.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class XFGameViewModel {
    var games: [XFGameModel] = [XFGameModel]()
}

extension XFGameViewModel {
    func loadAllGameData(finishCallBack: @escaping () -> ()) {
        XFNetworkTool.requestData(type: .GET, URLString: kHomeGameUrl, parameters: ["shortName" : "game"]) { (result) in
            
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            for dict in dataArray {
                self.games.append(XFGameModel(dict: dict))
            }
            
            finishCallBack()
        }
    }
}
















