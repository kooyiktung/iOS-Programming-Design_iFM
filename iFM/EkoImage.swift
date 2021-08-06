//
//  EkoImage.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class EkoImage: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //实现圆角
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width/2
        //实现边框
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7).cgColor
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
