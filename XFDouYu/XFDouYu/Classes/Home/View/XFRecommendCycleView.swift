//
//  XFRecommendCycleView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

// MARK:- 定义常量

fileprivate let kCycleCellID = "kCycleCellID"

class XFRecommendCycleView: UIView {
    
    // MARK:- 定义属性
    var cycleTimer: Timer?
    var cycleModels: [XFCycleModel]? {
        didSet {
            // 刷新 collectionView 
            collectionView.reloadData()
            
            // 设置 pageControl 的个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            // 添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    // MARK:- 拖线属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置不能自动拉伸
        autoresizingMask = UIViewAutoresizing()
        
        // 注册 cell
        collectionView.register(UINib(nibName: "XFCollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置 collectionView 的布局
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

// MARK:-  提供一个通过 xib 快速创建的类方法
extension XFRecommendCycleView {
    class func recommendCycleView() -> XFRecommendCycleView {
        return Bundle.main.loadNibNamed("XFRecommendCycleView", owner: nil, options: nil)!.first as! XFRecommendCycleView
    }
}

// MARK:- collectionView 的数据源
extension XFRecommendCycleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! XFCollectionCycleCell
        
        cell.cycleModel = cycleModels![(indexPath as NSIndexPath).item % cycleModels!.count]
        
        return cell
    }
}

// MARK:- collectionView 代理
extension XFRecommendCycleView: UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 计算滚动偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 设置 pageControl 的当前页
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addCycleTimer()
    }
}

// MARK:- 定时器 
extension XFRecommendCycleView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    fileprivate func removeCycleTimer() {
        // 移除
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    @objc fileprivate func scrollToNext() {
        // 1. 获取滚动偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        // 2. 滚动到该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}














