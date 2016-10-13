//
//  XFAmuseMenuView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/10/13.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

private let kMenuCellID = "XFAmuseMenuViewCell"

class XFAmuseMenuView: UIView {
    
    // MARK:- 定义属性
    var groups: [XFAnchorGroup]? {
        didSet {
            // 一旦拿到新数据就刷新
            collectionView.reloadData()
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- 从 nib 加载
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "XFAmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
    }
    
    // MARK:- 设置 layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

extension XFAmuseMenuView {
    class func amuseMenuView() -> XFAmuseMenuView {
        return Bundle.main.loadNibNamed("XFAmuseMenuView", owner: nil, options: nil)?.first as! XFAmuseMenuView
    }
}

extension XFAmuseMenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil { return 0}
        let pageNum = (groups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath) as! XFAmuseMenuViewCell
        // 赋值给 cell
        setUpCellDataWithCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    private func setUpCellDataWithCell(cell: XFAmuseMenuViewCell, indexPath: IndexPath) {
        
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        
        // 判断越界问题
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        
        // 取出数据, 赋值给 cell
        cell.groups = Array(groups![startIndex...endIndex])
    }
}

extension XFAmuseMenuView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
}


















