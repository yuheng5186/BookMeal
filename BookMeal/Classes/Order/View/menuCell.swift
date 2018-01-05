//
//  menuCell.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2018/1/4.
//  Copyright © 2018年 巫星林. All rights reserved.
//

import UIKit

class menuCell: UITableViewCell {

    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodCountLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
