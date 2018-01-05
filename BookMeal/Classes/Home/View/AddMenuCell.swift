//
//  AddMenuCell.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2018/1/5.
//  Copyright © 2018年 巫星林. All rights reserved.
//

import UIKit

class AddMenuCell: UITableViewCell {

    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuCountLabel: UILabel!
    
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func reduceButtonClick(_ sender: Any) {
    }
    @IBAction func plusButtonClick(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
