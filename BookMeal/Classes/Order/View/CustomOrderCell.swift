//
//  CustomOrderCell.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2018/1/4.
//  Copyright © 2018年 巫星林. All rights reserved.
//

import UIKit

private let ID_MenuCell = "menuCell"
class CustomOrderCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var allOrderCountLabel: UILabel!
    @IBOutlet weak var orderRemindLabel: UILabel!
    
    @IBOutlet weak var cancelOrderButton: UIButton!
    
    @IBOutlet weak var menuListTableView: UITableView!
    
    
    var orderListModel:OrderModel?{
        didSet{
            
            dateLabel.text = orderListModel?.date
            timeLabel.text = orderListModel?.time
            statusLabel.text = orderListModel?.status
            allOrderCountLabel.text = orderListModel?.orderCount
            
            menuListTableView .reloadData()
        }
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuListTableView.register(UINib(nibName: "menuCell", bundle: nil), forCellReuseIdentifier: ID_MenuCell)
        menuListTableView.delegate = self
        menuListTableView.dataSource = self
        menuListTableView.rowHeight = 30
        
        
        cancelOrderButton.layer.borderWidth = 2
        cancelOrderButton.layer.cornerRadius = 5
        cancelOrderButton.layer.borderColor = COLOR_NUMBER.cgColor
        
        
        //定义富文本即有格式的字符串
        let attributedStr : NSMutableAttributedString = NSMutableAttributedString()
        
        let allOrderCount : NSAttributedString = NSAttributedString(string: "共计4件,预付", attributes: [ NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0)])
        let price : NSAttributedString = NSAttributedString(string: "108", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14.0)])
        let money : NSAttributedString = NSAttributedString(string: "元", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0)])
        
        attributedStr.append(allOrderCount)
        attributedStr.append(price)
        attributedStr.append(money)
        
        allOrderCountLabel.attributedText = attributedStr
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}

extension CustomOrderCell:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID_MenuCell, for: indexPath) as! menuCell
        cell.selectionStyle = .none
        cell.foodNameLabel.text = "糖醋排骨"
        cell.foodPriceLabel.text = "x36"
        cell.foodCountLabel.text = "x3"
        
        return cell
    }
    
    
    
 
    
}




