//
//  BMNavigationController.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

class BMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UINavigationBar.appearance()
        
        navBar.setBackgroundImage(UIImage.ld_image(color: COLOR_NAV_BG), for: .default)
        navBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17),NSAttributedStringKey.foregroundColor:COLOR_TITLE]
        //        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        
        
        
    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(navigationBack))
            viewController.navigationItem.leftBarButtonItem?.tintColor  = COLOR_TITLE

        }
        super.pushViewController(viewController, animated: true)
        //修正tabbar的frame Bug
        var frame: CGRect = self.tabBarController?.tabBar.frame ?? CGRect.zero
        frame.origin.y = UIScreen.main.bounds.size.height - (frame.size.height)
        self.tabBarController?.tabBar.frame = frame
    }
    
    @objc func navigationBack() {
        popViewController(animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
