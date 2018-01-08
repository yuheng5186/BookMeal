//
//  PrdouctMenuTableViewCell.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/26.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

let screenHeight = UIScreen.main.bounds.height
let screenWidth  = UIScreen.main.bounds.width


protocol RightCellDelegate {
    func btnClick(index: NSInteger ,name: String)
}


let LoginSucessPostNotification = "LOGIN_SUCCESS_NOTIFICATION_POST_NOTIFICATION"


class PrdouctMenuTableViewCell: UITableViewCell,CAAnimationDelegate {

    var delegate: RightCellDelegate?

    
    var productName:UILabel!
    var minusBtn:UIButton!
    var plusBtn:UIButton!
    var buyCount:UILabel!
    var separateLine:UIView?
    ///实际项目中此处应该传model
    var productNameStr:String?
    ///声明闭包
    var addProClosure:((UITableViewCell,Bool)->())?
    
    var plusCountClick:(()->Void)!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.productName = UILabel(frame:CGRect(x: 15,y: 15,width: (screenWidth*0.7) - 30,height: 20))
        self.productName.font = UIFont.systemFont(ofSize: 15)
        self.productName.textColor = UIColor.black
        self.productName.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(self.productName)
        
        self.plusBtn = UIButton(type: UIButtonType.custom)
        self.plusBtn.frame =  CGRect(x: (screenWidth*0.7) - 59,y: 36,width: 44,height: 44)
        self.plusBtn.setImage(UIImage(named: "btn_increase"), for: UIControlState())
        self.plusBtn.addTarget(self, action: #selector(PrdouctMenuTableViewCell.plusBtnClick(_:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(self.plusBtn)
        
        self.separateLine = UIView(frame:CGRect(x: 0,y: 85-0.5,width: screenWidth*0.7,height: 0.5))
        self.separateLine?.backgroundColor = UIColor.red
        self.contentView.addSubview(self.separateLine!)
        
        
        self.minusBtn = UIButton(type: UIButtonType.custom)
        self.minusBtn.frame =  CGRect(x: (screenWidth*0.7) - 59,y: 36,width: 44,height: 44)
        self.minusBtn.setImage(UIImage(named: "btn_decrease"), for: UIControlState())
        self.minusBtn.addTarget(self, action: #selector(PrdouctMenuTableViewCell.minusBtnClick(_:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(self.minusBtn)
        
        self.buyCount = UILabel(frame: CGRect(x: (screenWidth*0.7) - 59,y: 36,width: 44,height: 44))
        self.buyCount.font = UIFont.systemFont(ofSize: 13)
        self.buyCount.textColor = COLOR_NUMBER
        self.buyCount.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(self.buyCount)
        
        self.contentView.bringSubview(toFront: self.plusBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.productName.text = self.productNameStr
    }
    
    @objc func plusBtnClick(_ btn:UIButton){
        
        delegate?.btnClick(index:btn.tag ,name:btn.titleLabel!.text!)

//        let center = NotificationCenter.default//创建通知
//
//        center.addObserver(self, selector: #selector(HomeViewController.receiveValue(_:)), name: "passValue", object: nil)//单个值得传递
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: LoginSucessPostNotification), object: false)

        
        
        let point:CGPoint = self.convert(btn.frame.origin, to: (UIApplication.shared.delegate?.window)!)
        let circleView:UIView = UIView(frame:CGRect(x: point.x,y: point.y,width: 40,height: 40))
        circleView.layer.cornerRadius = 20
        circleView.backgroundColor = COLOR_NUMBER
        let window:UIWindow! = (UIApplication.shared.delegate?.window)!
        window.addSubview(circleView)
        let keyframeAnimation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        let path:CGMutablePath = CGMutablePath()
        //动画的开始坐标
        path.move(to: CGPoint(x:circleView.layer.position.x, y:circleView.layer.position.y))
        //to:动画结束的坐标
        //control1:开始和结束中间的一个坐标
        //control2:开始和结束中间的第二个坐标
        path.addCurve(to: CGPoint(x:30, y:screenHeight-30), control1: CGPoint(x: circleView.layer.position.x-150, y: circleView.layer.position.y-30), control2: CGPoint(x: circleView.layer.position.x-200, y:  circleView.layer.position.y+40))
        keyframeAnimation.path = path
        keyframeAnimation.delegate = self
        keyframeAnimation.duration = 0.5
        circleView.layer.add(keyframeAnimation, forKey: "position");
        //动画完成后移除view
        circleView.perform(#selector(UIView.removeFromSuperview), with: nil, afterDelay: 0.45)
        
        ///实际项目中此处应加上对库存的判断
        if self.buyCount.text == nil
        {
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.minusBtn.frame.origin.x = (screenWidth*0.7) - 157
                self.buyCount.frame.origin.x = (screenWidth*0.7) - 108
                self.minusBtn.alpha = 1.0
                self.buyCount.text = "1"
            })
        }
        else
        {
            self.buyCount.text = String(Int(self.buyCount.text!)!+1)
        }
        if addProClosure != nil
        {
            addProClosure!(self,true)
        }
    }
    
    @objc func minusBtnClick(_ btn:UIButton)
    {
        ///实际项目中此处应加上对库存的判断
        if Int(self.buyCount.text!) > 1
        {
            self.buyCount.text = String(Int(self.buyCount.text!)!-1)
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.minusBtn.frame.origin.x = (screenWidth*0.7) - 59
                self.buyCount.frame.origin.x = (screenWidth*0.7) - 59
                self.minusBtn.alpha = 0.0
                self.buyCount.text = nil
            })
        }
        if addProClosure != nil
        {
            addProClosure!(self,false)
        }
    }

}
