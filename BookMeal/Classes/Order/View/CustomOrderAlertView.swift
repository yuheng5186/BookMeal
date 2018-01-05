//
//  CustomOrderAlertView.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/27.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

protocol CustomOrderAlertViewDelegate {
    func performAction(buttonIndex:Int,view:CustomOrderAlertView)
}


class CustomOrderAlertView: UIView {

    let firstButton: UIButton = UIButton()

    let secondButton: UIButton = UIButton()

    let labelMessage: UILabel = UILabel()

    var delegate: CustomOrderAlertViewDelegate?

    
    init(view: UIView,firstButtonTitle: String, firstButtonColor: UIColor, secondButtonTitle: String,secondButtonColor: UIColor, Message: String){
        super.init(frame: view.frame)
        var firstButtonFrame = CGRect(x:self.frame.minX, y:self.frame.maxY - self.frame.height/10,width:self.frame.width/2, height:self.frame.height/10)
        var secondButtonFrame = CGRect(x:self.frame.midX, y:self.frame.maxY - self.frame.height/10,width:self.frame.width/2, height:self.frame.height/10)
        
    }
    
    func addBlurView(){
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            self.frame = window.frame
            let blurEffect = UIBlurEffect(style: .dark)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame.size = CGSize(width: window.frame.size.width , height: window.frame.size.height)
            blurView.center = window.center
            self.addSubview(blurView)
            self.tag = 1
            window.addSubview(self)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}




