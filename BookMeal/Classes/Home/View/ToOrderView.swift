//
//  ToOrderView.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2018/1/5.
//  Copyright © 2018年 巫星林. All rights reserved.
//

import UIKit

class ToOrderView: UIView {

    var showShopListButtonCLick:(()->Void)!
    
    var removeShopListButtonCLick:(()->Void)!

    
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBAction func shopListButtonClick(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true {
            
            if (self.showShopListButtonCLick != nil) {
                self.showShopListButtonCLick()
            }
        }else {
            
            if (self.removeShopListButtonCLick != nil) {
                self.removeShopListButtonCLick()
            }
        }
        
    }
    
    
}
