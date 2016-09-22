//
//  XFPageTitleView.swift
//  XFDouYu
//
//  Created by xiaofans on 16/9/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

fileprivate let kScroLineH: CGFloat = 2

class XFPageTitleView: UIView {
    
    // MARK:- 定义属性
    fileprivate var titles: [String]
    
    // MARK:- 懒加载属性
    fileprivate lazy var titleLabels: [UILabel] = [UILabel]()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()

    // MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置界面
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK:- 设置 UI 界面
extension XFPageTitleView {
    fileprivate func setUpUI() {
        // 1. 添加 scrollview
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2. 添加 title 对应的 label
        setUpTitleLabels()
        
        // 3. 设置底部滚动条
        setUpBottomLineAndScroLine()
    }
    
    fileprivate func setUpTitleLabels() {
        // 先确定 label 的一些 frame 值
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScroLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    fileprivate func setUpBottomLineAndScroLine() {
        // 1. 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        
        addSubview(bottomLine)
        
        // 2. 添加 scrollLine
        guard let firstLabel = titleLabels.first else { return }
        
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScroLineH, width: firstLabel.frame.width, height: kScroLineH)
    }
}
















