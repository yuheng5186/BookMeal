//
//  HomeViewController.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit
import SnapKit



class HomeViewController: BaseViewController {

    private let orderButton = UIButton().then {
        $0.setTitle("订单", for: .normal)
        $0.setTitleColor(COLOR_CONTENT, for: .normal)
        $0.addTarget(self, action: #selector(HomeViewController.orderButtonClick), for: .touchUpInside)
        
        
        
    }
    
    @objc func orderButtonClick(){
        print("999999999")
        let orderVC = LoginViewController()
        orderVC.title = "我的订单"
        self.navigationController?.pushViewController(orderVC, animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title  = "加加点餐"
        
        let exitItem = UIBarButtonItem(title: "退出", style: .plain, target: self, action: #selector(orderButtonClick))
        exitItem.tintColor = COLOR_TITLE
        exitItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        self.navigationItem.leftBarButtonItem = exitItem

        
        let orderItem = UIBarButtonItem(title: "订单", style: .plain, target: self, action: #selector(orderButtonClick))
        orderItem.tintColor = COLOR_TITLE
        orderItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        self.navigationItem.rightBarButtonItem = orderItem
        
        
        
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "订单", style: .plain, target: self, action: #selector(orderButtonClick))
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "return")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(orderButtonClick))

        
//        self.navigationItem.rightBarButtonItem?.tintColor  = COLOR_TITLE

//        self.view.addSubview(orderButton)
//
//        orderButton.snp.makeConstraints { (make) in
//            make.left.equalTo(10)
//            make.top.equalTo(20+kNavigationBar_H+kStatusBar_H)
//            make.width.equalTo(100)
//            make.height.equalTo(35)
//        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
