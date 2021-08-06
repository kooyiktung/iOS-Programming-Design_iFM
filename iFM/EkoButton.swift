//
//  EkoButton.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class EkoButton: UIButton {
    
    //状态，是不是播放状态
    var isPlay:Bool = true
    //播放按钮图片
    let imgPlay:UIImage = UIImage(named:"start")!
    //暂停按钮图片
    let imgPause:UIImage = UIImage(named:"pause")!
    //初始化，监听点击事件
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
    }
    //点击响应方法
    @objc func onClick(){
        isPlay = !isPlay
        if isPlay {
            self.setImage(imgPause, for: UIControl.State.normal)
        }else {
            self.setImage(imgPlay, for: UIControl.State.normal)
        }
    }
    //播放方法
    func onPlay(){
        isPlay = true
        
        self.setImage(imgPause, for: UIControl.State.normal)
    }

}
