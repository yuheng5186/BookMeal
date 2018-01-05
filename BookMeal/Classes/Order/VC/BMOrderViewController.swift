//
//  BMOrderViewController.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

private let ID_CustomOrderCell = "CustomOrderCell"

class BMOrderViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    //懒加载tableview
    private lazy var tableViewMain :UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain)
        
    fileprivate var goodArray = [OrderCellModel]()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        loadDataSource()

        setUpTable()
        
    }
  
    func setUpTable(){
       
        
        self.view.addSubview(tableViewMain)
        //去分割线
//        tableViewMain.separatorStyle = UITableViewCellSeparatorStyle.none
        
        if #available(iOS 11.0, *) {
            tableViewMain.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        //注册cell重用
        tableViewMain.register(UINib(nibName: "CustomOrderCell", bundle: nil), forCellReuseIdentifier: ID_CustomOrderCell)

//        tableViewMain.sectionFooterHeight = 20
        //开启自动计算高度
        //【重点】注意千万不要实现行高的代理方法，否则无效：heightForRowAt
        tableViewMain.estimatedRowHeight = 44//预估高度，随便设置
        tableViewMain.rowHeight = UITableViewAutomaticDimension
        
    }
    
    
    func loadDataSource(){
       
        for _ in 0..<10 {
            var dict = [String :AnyObject]()
            dict["dataTime"] = "2017-12-26 13:12:11" as AnyObject
            dict["status"] = "待领取" as AnyObject
            dict["menu"] = "糖醋排骨" as AnyObject
            dict["price"] = "价格28元" as AnyObject
            dict["total"] = "共计30件" as AnyObject

            goodArray.append(OrderCellModel(dict:dict))
        }
        

    }
    
    //代理方法

   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 285
        
//        guard  let finalArr = self.homeVM.homeListModels[indexPath.row].lastPoint else {
//            return rowHeight
//        }
//        rowHeight = rowHeight + CGFloat(finalArr.count * 20)
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView(frame: CGRect(x:0, y:0,width:self.view.frame.size.width, height:20))
        view.backgroundColor = UIColor.red
        
        return  view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID_CustomOrderCell, for: indexPath) as! CustomOrderCell
        //cell样式，取消选中
        cell.selectionStyle = .none
        //传值
//        cell.showAppInfoWithModel(model: goodArray[indexPath.row])
        
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    



}
