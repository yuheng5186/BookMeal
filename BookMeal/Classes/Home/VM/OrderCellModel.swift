//
//  OrderCellModel.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/26.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

@objcMembers
class OrderCellModel: NSObject {

    var dataTime : String?
    var status   : String?
    var menu     : String?
    var price    : String?
    var total    : String?
    var isArray  : Bool?
    
    
    
    init(dict:[String:AnyObject]) {
        super .init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
