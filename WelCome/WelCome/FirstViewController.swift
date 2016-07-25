//
//  FirstViewController.swift
//  WelCome
//
//  Created by zhz on 16/7/25.
//  Copyright © 2016年 zhz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "swift"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(click))
        
        btn.frame = CGRectMake(20, 100, self.view.frame.width - 40,50)
        btn.setTitle("欢迎来到swift", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn.backgroundColor = UIColor.orangeColor()
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.alpha = 0
        
        UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
          self.btn.frame = CGRectMake(20, 100, self.view.frame.width - 40,50)
            self.btn.alpha = 1
            self.view.addSubview(self.btn)
            }, completion: nil)
        // Do any additional setup after loading the view.
    }
    func click()
    {
        self.navigationController?.popViewControllerAnimated(true)
        self.navigationController?.navigationBar.hidden = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
