//
//  OrderButton.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class OrderButton: UIButton {

    var order :Int = 1
    
    let order1:UIImage = UIImage(named:"order1")!
    let order2:UIImage = UIImage(named:"order2")!
    let order3:UIImage = UIImage(named:"order3")!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(self.onClick(sender:)), for: .touchUpInside)
        
        
    }
    
    @objc func onClick(sender:UIButton){
        order += 1
        if order == 1 {
            self.setImage(order1, for: .normal)
        }else if order == 2 {
            self.setImage(order2, for: .normal)
        }else if order == 3 {
            self.setImage(order3, for: .normal)
        }else if order > 3 {
            order = 1
            self.setImage(order1, for: .normal)
        }
    }

    
}
