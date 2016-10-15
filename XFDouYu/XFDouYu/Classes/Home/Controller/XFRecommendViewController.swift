//
//  XFRecommendViewController.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 常量
private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH: CGFloat = 90

class XFRecommendViewController: XFBaseAnchorVC {

    // MARK:- 懒加载属性
    fileprivate lazy var recommentVM: XFRecommendViewModel = XFRecommendViewModel()
    
    fileprivate lazy var cycleView: XFRecommendCycleView = {
        let cycleView = XFRecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    
    fileprivate lazy var gameView: XFRecommendGameView = {
        let gameView = XFRecommendGameView.recommentGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
}

// MARK:- 设置UI
extension XFRecommendViewController {
    override func setUpUI() {
        super.setUpUI()
        
        // 1. collectionView加到控制器 view
        view.addSubview(collectionView)
        
        // 2. cycleView 加到 collectionView
        collectionView.addSubview(cycleView)
        
        // 3. 添加 gameView 到 collectionView
        collectionView.addSubview(gameView)
        
        // 设置 collectionview 内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK:- 请求数据
extension XFRecommendViewController {
    override func loadData() {
        // 给父类 vm 赋值
        baseVM = recommentVM
        
        // 请求推荐数据
        recommentVM.requestData {
            // 1. 展示推荐数据
            self.collectionView.reloadData()
            
            // 2. 显示 game 推荐数据
            var groups = self.recommentVM.anchorGroups
            // 2.1 移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            // 2.2 添加更多租
            let moreGroup = XFAnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            self.gameView.groups = groups
            
            // 3. 数据请求完成, 隐藏动画界面
            self.loadDataFinished()
        }
        
        // 请求轮播数据
        recommentVM.requestCycleData {
            self.cycleView.cycleModels = self.recommentVM.cycleModel
        }
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension XFRecommendViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            // 取出 prettycell
            let pretyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! XFCollectionPrettyCell
            pretyCell.anchor = recommentVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return pretyCell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
}

















