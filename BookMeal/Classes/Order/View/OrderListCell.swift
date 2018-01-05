//
//  OrderListCell.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/25.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

class OrderListCell: UITableViewCell {

//    fileprivate lazy var dataTimeLabel  : UILabel = UILabel()
    
    fileprivate lazy var dataTimeLabel: UILabel = {
        let dataTimeLabel = UILabel()
        return dataTimeLabel
    }()
    
    
    fileprivate lazy var getStatusLabel : UILabel = UILabel()
    fileprivate lazy var totalPayLabel  : UILabel = UILabel()
    fileprivate lazy var cancelLabel    : UILabel = UILabel()

    
    
    func showAppInfoWithModel(model: OrderCellModel) {

        dataTimeLabel.text = model.dataTime
        getStatusLabel.text = model.status
        totalPayLabel.text  = model.menu
        
        self.InitUI(bool:true)

             }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        //创建UI

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func InitUI(bool:Bool){
        
        dataTimeLabel.numberOfLines = 0
        dataTimeLabel.backgroundColor = UIColor.white
        contentView.addSubview(dataTimeLabel)
        dataTimeLabel.snp.makeConstraints({ (make) in
            
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        })
        
        getStatusLabel.numberOfLines = 0
        getStatusLabel.backgroundColor = UIColor.white
        contentView.addSubview(getStatusLabel)
        if bool == true {
            
            getStatusLabel.snp.makeConstraints({ (make) in
                make.centerY.equalTo(dataTimeLabel.snp.centerY)
                make.right.equalTo(contentView.snp.right).offset(-20)
            })
        }else {
            
            getStatusLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(dataTimeLabel.snp.bottom).offset(10)
                make.left.equalTo(10)
                make.right.equalTo(-20)
            })
        }
       
       
        totalPayLabel.numberOfLines = 0
        totalPayLabel.backgroundColor = UIColor.white
        contentView.addSubview(totalPayLabel)
        totalPayLabel.snp.makeConstraints({ (make) in
            
            make.top.equalTo(getStatusLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
//            make.bottom.equalTo(contentView).offset(-20)
        })
        
        cancelLabel.backgroundColor = UIColor.white
        cancelLabel.text = "取消"
        cancelLabel.textAlignment = .center
        cancelLabel.textColor = UIColor.red
        cancelLabel.layer.cornerRadius = 5
        cancelLabel.layer.borderWidth = 2
        cancelLabel.layer.borderColor = COLOR_NUMBER.cgColor
        cancelLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        
        cancelLabel.addGestureRecognizer(tapGesture)
        
        
        contentView.addSubview(cancelLabel)
        cancelLabel.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.top.equalTo(totalPayLabel.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        
        
        
    }
    
    @objc func tapClick(){
        
        print("9999999")
        let alertController = UIAlertController(title: "提示", message: "是否确认取消预定？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"取消",style:.cancel,handler:nil)
        let okAction = UIAlertAction(title:"确定",style:.default,handler:{
        (UIAlertAction)->Void in
            print("8888888")
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
