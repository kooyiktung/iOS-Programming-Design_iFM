//
//  MyViewController.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,HttpProtocol1 {
    
   
    var tableData1 = [JSON]()
    
    //网络操作类的实例
    var eHttp:HTTPController1 = HTTPController1()
    func didRecieveResults(results: AnyObject) {
        let json = JSON(results)
//        print(json)
//        print(json["list"])
        if let pindao = json["list"].array{
            
            self.tableData1 = pindao
            //            print(duanzi)
        }else{
            print("meiyoushuchu")
        }
        self.tv.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //通过标识符重用cell
        let cell:UITableViewCell = tv.dequeueReusableCell(withIdentifier: "classify")!
        //让cell背景透明
        cell.backgroundColor = UIColor.clear
        //获取cell的数据
        let rowData:JSON = tableData1[indexPath.row]
        //设置cell的标题
        cell.textLabel?.text = rowData["title"].string
        //        print(rowData["title"].string as Any)
        cell.detailTextLabel?.text = rowData["name"].string
        //设置略缩图
        cell.imageView?.image = UIImage(named: "logo")
        //封面的地址
        let url = rowData["coverPath"].string
        //获取略缩图
        Alamofire.request(url!, method: .get).responseJSON { (data) -> Void  in
            //将获取的图像数据赋予imgView
            let img = UIImage(data: data.data! )
            cell.imageView?.image = img
        }
        tv.backgroundColor = UIColor.clear
        
//        let cell = tv.dequeueReusableCell(withIdentifier: "classify")!
//        cell.textLabel?.text = "标题：\(indexPath.row)"
//        cell.detailTextLabel?.text = "子标题：\(indexPath.row)"
//        //设置略缩图
//        cell.imageView?.image = UIImage(named: "logo")
        
        return cell
    }
    
    
    

    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //为网络操作类设置代理
        eHttp.delegate = self
        eHttp.onChannel(url: "http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=and-d8&code=43_310000_3100&device=android&picVersion=11&scale=2&version=5.4.45")
        tv.dataSource = self
        tv.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
}
