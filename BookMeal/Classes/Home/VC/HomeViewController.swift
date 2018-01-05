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

    var productTypeArrw:[String] = []
    var productNameArrw:[AnyObject] = []
    
    lazy var toPayView:ToOrderView = {
        let toPayView = Bundle.main.loadNibNamed(String(describing:ToOrderView.self), owner: nil, options: nil)?.last as! ToOrderView
        return toPayView
        
    }()
    
    lazy var orderListView:MenuListView = {
        let orderListView = Bundle.main.loadNibNamed(String(describing:MenuListView.self), owner: nil, options: nil)?.last as! MenuListView
        return orderListView

    }()
    
    
    private let orderButton = UIButton().then {
        $0.setTitle("订单", for: .normal)
        $0.setTitleColor(COLOR_CONTENT, for: .normal)
        $0.addTarget(self, action: #selector(HomeViewController.orderButtonClick), for: .touchUpInside)
        
    }
    
    
    
    
    @objc func logoutButtonClick(){
        
        let logoutVC = LoginViewController()
        self.navigationController?.present(logoutVC, animated: true, completion: nil)
    }
    
    @objc func orderButtonClick(){
        print("999999999")
        let orderVC = BMOrderViewController()
        orderVC.title = "我的订单"
        self.navigationController?.pushViewController(orderVC, animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title  = "加加点餐"
        
        let exitItem = UIBarButtonItem(title: "退出", style: .plain, target: self, action: #selector(logoutButtonClick))
        exitItem.tintColor = COLOR_TITLE
        exitItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        self.navigationItem.leftBarButtonItem = exitItem

        
        let orderItem = UIBarButtonItem(title: "订单", style: .plain, target: self, action: #selector(orderButtonClick))
        orderItem.tintColor = COLOR_TITLE
        orderItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        self.navigationItem.rightBarButtonItem = orderItem
        
        
        self.initData()

        
    }

    func  initData()
    {
        let path:String = (Bundle.main.path(forResource: "MenuData", ofType: "json"))!
        let data:Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let json:AnyObject = try!JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
        let resultDict = json.object(forKey: "data") as! Dictionary<String,AnyObject>
        let productMenuArr:[AnyObject] = resultDict["productType"] as! Array
        for i:Int in 0 ..< productMenuArr.count
        {
            print(productMenuArr.count)
            productTypeArrw.append(productMenuArr[i]["typeName"] as! String)
            productNameArrw.append(productMenuArr[i]["productName"] as! [String] as AnyObject)
        }
        
        self.addSubView()
    }
    
    
    func addSubView(){
        ///调用时传入frame和数据源
        let classifyTable = GroupTableView(frame: CGRect(x: 0,y: 0,width: screenWidth,height: screenHeight-64), MenuTypeArr: productTypeArrw, proNameArr: productNameArrw)
        classifyTable.productNameArr = productNameArrw
        classifyTable.productTypeArr = productTypeArrw
        self.view.addSubview(classifyTable)
        
        
        
        
        
        toPayView.frame = CGRect(x: 0, y: SCREEN_H-64-59, width: SCREEN_W, height: 59)
        toPayView.showShopListButtonCLick = {
                        
            self.orderListView.frame = CGRect(x: 0, y: SCREEN_H-64-59-200, width: SCREEN_W, height: 200)
            
            self.view.insertSubview(self.orderListView, belowSubview: self.toPayView)
            
        }
        toPayView.removeShopListButtonCLick = {
            
            self.orderListView.removeFromSuperview()
        }
        
        view.addSubview(toPayView)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
