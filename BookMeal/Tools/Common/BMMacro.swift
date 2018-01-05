//
//  BMMacro.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit


//********************** Key ***********************

let KEY_FirstLaunch = "KEY_FirstLaunch"
let KEY_Login_Status = "KEY_Login_Status"


//********************* Screen *********************

// iPhone 5
let isIPhone_4S  = SCREEN_H == 480 ? true : false
// iPhone 5
let isIPhone_5   = SCREEN_H == 568 ? true : false
// iPhone 6
let isIPhone_6   = SCREEN_H == 667 ? true : false
// iPhone 6P
let isIPhone_6P  = SCREEN_H == 736 ? true : false
// iPhone 8X
let isIPhone_8X  = SCREEN_H == 812 ? true : false

// 屏幕的宽
let SCREEN_W = UIScreen.main.bounds.size.width
// 屏幕的高
let SCREEN_H = UIScreen.main.bounds.size.height

let kStatusBar_H : CGFloat      = isIPhone_8X ? 44 : 20
let kNavigationBar_H : CGFloat  = 44
let  kTabbar_H : CGFloat        = isIPhone_8X ? 34 + 49 : 49
let kTitleView_H : CGFloat      = 40
let margin: CGFloat             = 10.0
let video_H                     = SCREEN_W * 12.0 / 16.0



//********************* Color *********************

//导航背景 橙色
let COLOR_NAV_BG                = UIColor("ECF9FB")
//标题颜色
let COLOR_TITLE                 = UIColor("60AAC2")
//文本颜色
let COLOR_CONTENT               = UIColor("4ab6d3")
// 数量颜色
let COLOR_NUMBER                = UIColor("F09C13")


let UIRate = (UIScreen.main.bounds.size.width/375)









