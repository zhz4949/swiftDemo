//
//  ViewController.swift
//  WelCome
//
//  Created by zhz on 16/7/25.
//  Copyright © 2016年 zhz. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var scrollView = UIScrollView()
    var pageScroll = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageScroll.center = CGPointMake(self.view.frame.width / 2, self.view.frame.height - 30)
        // 当前页面的指针颜色
        pageScroll.currentPageIndicatorTintColor = UIColor.redColor()
        // 未滑动的指针颜色
        pageScroll.pageIndicatorTintColor = UIColor.blackColor()
        pageScroll.numberOfPages = 5
        
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(5*self.view.frame.width, 0)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        for i in 0..<5
        {
            print("fsdhfkhhdshhkfjk------\(i)")
            let image = UIImage (named: "welcome\(i+1)")
            let imageView = UIImageView (frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            
            imageView.image = image;
            imageView.frame.origin.x = CGFloat(i)*imageView.frame.size.width
            scrollView.addSubview(imageView)
            self.view.addSubview(pageScroll)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ViewController:UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.view.frame.width)
        pageScroll.currentPage = index
        
        
    }
}
