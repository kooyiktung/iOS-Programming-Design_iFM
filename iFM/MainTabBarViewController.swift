//
//  MainTabBarViewController.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/15.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

//    init() {
//        super.init(nibName: nil, bundle:nil)
//        let indexVC = IndexViewController()
//        indexVC.title = "首页"
//        indexVC.tabBarItem.image = UIImage(named: "index") //设置首页图标
//        let playVC = PlayViewController()
//        playVC.title = "播放列表"
//        playVC.tabBarItem.image = UIImage(named: "play")
//        let myVC =  MyViewController()
//        myVC.title = "个人首页"
//        myVC.tabBarItem.image = UIImage(named: "my")
//        let shouye = UINavigationController(rootViewController: indexVC)
//        let bofang = UINavigationController(rootViewController: playVC)
//        let geren = UINavigationController(rootViewController: myVC)
//        self.viewControllers = [shouye,bofang,geren]
//        // Do any additional setup after loading the view.
//    }
//    required init(coder aDecoder: NSCoder){
//        super.init(coder: aDecoder)!
// fatalError("init(coder:) has not been implemented")
        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //修改标签栏选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 11.0)], for: .selected)
        //修改标签栏未被选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 11.0)], for: .normal)

        //修改图片颜色
//        var items:[UITabBarItem] = self.tabBar.items as![UITabBarItem]
//        let tabbar0SelectedImage = UIImage(named: "play")
//        let tabbar1SelectedImage = UIImage(named: "my")
//        //设置selectedImage
//        items[0].selectedImage = tabbar0SelectedImage!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        items[0].selectedImage = tabbar1SelectedImage!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        
        // Do any additional setup after loading the view.
    }
    

   

}
