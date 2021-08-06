//
//  ViewController.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: EkoImage!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.login.layer.cornerRadius = 5 ;
        //        self.logo.layer.masksToBounds = YES;
        
        
    }
    @objc func keyboardWillApprear( notification:NSNotification)  {
    }
    
    @objc func keyboardWillDisAppear(notification:NSNotification) {
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        let useStr = self.username.text
        let pwd = self.pwd.text
        if useStr?.count == 0 {
            let alertView = UIAlertView(title: "提示", message: "用户名不能为空", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alertView.show()
            return
        }
        
        if pwd?.count == 0 {
            let alertView = UIAlertView(title: "提示", message: "密码不能为空", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alertView.show()
            return
        }
        
        if useStr!.compare("admin") != .orderedSame || pwd!.compare("123456") != .orderedSame  {
            let alertView = UIAlertView(title: "提示", message: "用户名或密码填写不正确，请重新填写", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alertView.show()
            return
        }
        
        let startVC = MainTabBarViewController()
        self.performSegue(withIdentifier: "login", sender: startVC)

    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
}

