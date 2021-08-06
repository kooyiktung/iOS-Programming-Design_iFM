//
//  HTTPController1.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/16.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HTTPController1{
    //定义一个代理
    var delegate:HttpProtocol1?
    //接受网址,回调代理的方法,传回数据
    func onChannel(url:String) {
        Alamofire.request(url, method: .get).responseJSON { (data) -> Void  in
            self.delegate?.didRecieveResults(results: data.result.value as AnyObject)
        }
    }
}

//定义http协议
protocol HttpProtocol1 {
    //定义一个方法，接收一个参数: AnyObject
    func didRecieveResults(results:AnyObject)
    
}
