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
    var btn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
//        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
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
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        for i in 0..<5
        {
            let image = UIImage (named: "welcome\(i+1)")
            let imageView = UIImageView (frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            
            imageView.image = image;
            imageView.frame.origin.x = CGFloat(i)*imageView.frame.size.width
            scrollView.addSubview(imageView)
            self.view.addSubview(pageScroll)
        }
        btn.frame = CGRectMake(4*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
        btn.setTitle("进入swift界面", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.orangeColor()
        //            btn.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn.alpha = 0;
        btn.hidden = true
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.btn.frame = CGRectMake(4*self.view.frame.width, self.view.frame.height - 100, self.view.frame.width, 50)
            self.btn.alpha = 1
            self.scrollView.addSubview(self.btn)
            }, completion: nil)
        
    }
    
    func btnClick(button:UIButton){
        
        self.navigationController?.navigationBar.hidden = false
        let firstVC = FirstViewController()
        
//        self.presentViewController(firstVC, animated: true
//            , completion: nil)
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

extension ViewController:UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.view.frame.size.width)
        pageScroll.currentPage = index
        if (index == 4)
        {
            btn.hidden = false
            
        }
        else
        {
            btn.hidden = true
        }
    }
}