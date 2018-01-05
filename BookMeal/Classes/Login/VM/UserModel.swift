//
//  UserModel.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/27.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit
import HandyJSON
class UserModel: NSObject,NSCoding,HandyJSON {
    
    var name : String?
    var token : String?
    
    
    
    required override init() {
        super.init()
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(token, forKey: "token")
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        name = aDecoder.decodeObject(forKey: "name") as? String
        token = aDecoder.decodeObject(forKey: "token") as? String
        
        
    }
    
    
    
    class func saveUserInfo(userModel: UserModel) {
        NSKeyedArchiver.archiveRootObject(userModel, toFile: UserModel.DomainsPath())
    }
    
    
    class func loadUserInfo() -> UserModel? {
        let userModel =  NSKeyedUnarchiver.unarchiveObject(withFile: UserModel.DomainsPath()) as? UserModel
        return userModel
        
        
        
    }
    
    class func deleteUserInfo() {
        let fileManager = FileManager.default
        do{
            try fileManager.removeItem(atPath: UserModel.DomainsPath())
            print("user info delete success")
        }catch{
            print("user info delete failure")
        }
        
    }
    class func DomainsPath() -> String{
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = docPath.appendingPathComponent("UserInfo.plist")
        return filePath
    }
    
    
}
