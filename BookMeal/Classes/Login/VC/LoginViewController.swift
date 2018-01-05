//
//  LoginViewController.swift
//  BookMeal
//
//  Created by Mac WuXinLing on 2017/12/20.
//  Copyright © 2017年 巫星林. All rights reserved.
//

import UIKit
class LoginViewController: BaseViewController,CAAnimationDelegate {

    private let cancelButton = UIButton().then {
        $0.setImage(UIImage(named:"backImage")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.addTarget(self, action: #selector(LoginViewController.cancelButtonClick), for: .touchUpInside)
    }
    
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named:"login_logo")
    }
    
    private let userNameView = UIView().then {
        $0.backgroundColor = UIColor.clear
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    private let PassWordView = UIView().then {
        $0.backgroundColor = UIColor.clear
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    private let userNameImage = UIImageView().then {
        $0.image = UIImage(named:"name")
    }
    
    private let  nameTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.white
        $0.clearButtonMode = .whileEditing
        $0.placeholder = "请输入用户名"
    }
    
    private let  passTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.white
        $0.clearButtonMode = .whileEditing
        $0.placeholder = "请输入密码"
    }
    
    private let PassWordImage = UIImageView().then {
        $0.image = UIImage(named:"password")

    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("登录", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = COLOR_NUMBER
        $0.layer.cornerRadius = 25
        
        $0.addTarget(self, action: #selector(LoginViewController.loginButtonClick), for: .touchUpInside)
        
    }

    //FIXME: 修改
    @objc func cancelButtonClick(){
        
        self .dismiss(animated: true, completion: nil)
    }
    //MARK: 登录按钮
    @objc func loginButtonClick(){
        
        self .dismiss(animated: true, completion: nil)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.nameTextFieldChanged), name: NSNotification.Name(rawValue:"UITextFieldTextDidChangeNotification"),object: self.nameTextField)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.passTextFieldChanged), name: NSNotification.Name(rawValue:"UITextFieldTextDidChangeNotification"),object: self.passTextField)
    }
    
    @objc func nameTextFieldChanged(obj: Notification) {
        let textField: UITextField = obj.object as! UITextField
        guard let _: UITextRange = textField.markedTextRange else{
            if (textField.text! as NSString).length > 20{
                BMProgressHud.showText("用户名输入字符控制在20字")
                textField.text = (textField.text! as NSString).substring(to: 20)
            }
            return
        }
    }
    
    @objc func passTextFieldChanged(obj: Notification) {
        let textField: UITextField = obj.object as! UITextField
        guard let _: UITextRange = textField.markedTextRange else{
            if (textField.text! as NSString).length > 10{
                BMProgressHud.showText("密码输入字符控制在10字")
                textField.text = (textField.text! as NSString).substring(to: 10)
            }
            return
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:
            NSNotification.Name(rawValue:
                "UITextFieldTextDidChangeNotification"), object: self.nameTextField)
        NotificationCenter.default.removeObserver(self, name:
            NSNotification.Name(rawValue:
                "UITextFieldTextDidChangeNotification"), object: self.passTextField)
    }
    
    
    func setUpView(){
        self.view.backgroundColor   = UIColor.gray
        self.view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(00)
            make.top.equalTo(50*SCREEN_H/812)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(100*SCREEN_H/812)
            make.width.equalTo(152)
            make.height.equalTo(192)
        }
        
        self.view.addSubview(userNameView)
        userNameView.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(100*SCREEN_H/812)
            make.centerX.equalTo(logoImageView)
            make.width.equalTo(SCREEN_W-92)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(PassWordView)
        PassWordView.snp.makeConstraints { (make) in
            make.top.equalTo(userNameView.snp.bottom).offset(20*SCREEN_H/812)
            make.centerX.equalTo(logoImageView)
            make.width.equalTo(SCREEN_W-92)
            make.height.equalTo(50)
        }
        
        userNameView.addSubview(userNameImage)
        userNameImage.snp.makeConstraints { (make) in
            make.left.equalTo(userNameView.snp.left).offset(15)
            make.centerY.equalTo(userNameView.snp.centerY)
        }
        
        userNameView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { (make) in
            make.left.equalTo(userNameImage.snp.right).offset(15)
            make.centerY.equalTo(userNameView.snp.centerY)
            make.width.equalTo(SCREEN_W-92-userNameImage.frame.size.width-60)
        }
        
        
        PassWordView.addSubview(PassWordImage)
        PassWordImage.snp.makeConstraints { (make) in
            make.left.equalTo(PassWordView.snp.left).offset(15)
            make.centerY.equalTo(PassWordView.snp.centerY)
        }
        
        PassWordView.addSubview(passTextField)
        passTextField.snp.makeConstraints { (make) in
            make.left.equalTo(PassWordImage.snp.right).offset(15)
            make.centerY.equalTo(PassWordView.snp.centerY)
            make.width.equalTo(SCREEN_W-92-userNameImage.frame.size.width-60)

        }
        
        
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(PassWordView)
            make.top.equalTo(PassWordView.snp.bottom).offset(50*SCREEN_H/812)
            make.width.equalTo(SCREEN_W-92)
            make.height.equalTo(50)
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setUpView()
        
        let basic = CABasicAnimation(keyPath: "position.x");
        basic.duration = 0.7
        basic.fromValue = -view.bounds.size.width/2
        basic.toValue = view.bounds.width/2
        basic.fillMode = kCAFillModeBoth
        basic.delegate = self
        
        basic.setValue(logoImageView.layer, forKey: "layer")
        logoImageView.layer.add(basic, forKey: nil)
        
        basic.beginTime = CACurrentMediaTime()+0.5
        basic.setValue(userNameView.layer, forKey: "layer")
        userNameView.layer.add(basic, forKey: nil)
        
        basic.beginTime = CACurrentMediaTime()+0.6
        basic.setValue(PassWordView.layer, forKey: "layer")
        PassWordView.layer.add(basic, forKey: nil)
        
        basic.beginTime = CACurrentMediaTime()+0.6
        basic.setValue(loginButton.layer, forKey: "layer")
        loginButton.layer.add(basic, forKey: nil)
        
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let layer = anim.value(forKey: "layer")
        let puase = CABasicAnimation(keyPath: "transform.scale")
        puase.fromValue = 1.5
        puase.toValue = 1.0
        puase.duration = 0.25
        (layer as AnyObject).add(puase, forKey: nil)
    }
    
    
    
//    //MARK: UITextFieldDelegate
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//
//
//        if(nameTextField.text?.lengthOfBytes(using: String.Encoding.utf8) == 20){
//            BMProgressHud.showText("姓名输入字符控制在20字")
//
//            return false
//        }
//
//        if(passTextField.text?.lengthOfBytes(using: String.Encoding.utf8) == 10){
//
//            BMProgressHud.showText("输入字符控制在10字")
//
//            return false
//        }
//
//        return true
//
//    }
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        return true
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
//        IQKeyboardManager .sharedManager().enable = true

        
    }
    
    //TODO:
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
