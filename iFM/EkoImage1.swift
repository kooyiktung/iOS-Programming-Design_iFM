//
//  EkoImage1.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/15.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class EkoImage1: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //实现圆角
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width/2
        //实现边框
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7).cgColor
    }
    
    //旋转方法
    func  onRotation()  {
        //动画实例关键字
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        //初始值
        animation.fromValue = 0.0
        //结束值
        animation.toValue = .pi*2.0
        //动画执行时间
        animation.duration = 20
        //动画重复次数
        animation.repeatCount = 10000
        self.layer.add(animation, forKey: nil)
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
