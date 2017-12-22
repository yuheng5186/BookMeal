//
//  LoginViewController.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    private let cancelButton = UIButton().then {
        $0.setImage(UIImage(named:"return")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.addTarget(self, action: #selector(LoginViewController.cancelButtonClick), for: .touchUpInside)
        
    }
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named:"login_logo")
        
    }
    
    private let userNameView = UIView().then {
        $0.backgroundColor = UIColor.lightGray
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        
    }
    
    private let PassWordView = UIView().then {
        $0.backgroundColor = UIColor.lightGray
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        
    }
    
    
    
    @objc func cancelButtonClick(){
        
        self .dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor   = UIColor.gray
        self.view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(00)
            make.top.equalTo(50)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        
        self.view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalTo(152)
            make.height.equalTo(192)
            
        }
        
        self.view.addSubview(userNameView)
        userNameView.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(100)
            make.centerX.equalTo(logoImageView)
            make.width.equalTo(SCREEN_W-92)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(PassWordView)
        PassWordView.snp.makeConstraints { (make) in
            make.top.equalTo(userNameView.snp.bottom).offset(20)
            make.centerX.equalTo(logoImageView)
            make.width.equalTo(SCREEN_W-92)
            make.height.equalTo(50)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
