//
//  PlayViewController.swift
//  iFM
//
//  Created by Kooyiktung on 2019/1/10.
//  Copyright © 2019 yitong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MediaPlayer
import AVFoundation


class PlayViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,HttpProtocol {

    @IBOutlet weak var progress: UIImageView!
    
    var isAutoFinish:Bool = true
    @objc func playFinish(){
        if isAutoFinish{
            switch(btnOrder.order){
            case 1:
                //顺序播放
                currIndex += 1
                if currIndex > tableData.count - 1 {
                    self.currIndex = 0
                }
                onSelectRow(index: currIndex)
            case 2:
                //随机播放
                currIndex = Int(arc4random()) % tableData.count
                onSelectRow(index: currIndex)
            case 3:
                //单曲循环
                onSelectRow(index: currIndex)
            default:
                "default"
            }
        }else {
            isAutoFinish = true
        }
    }
    //顺序播放按钮
    @IBOutlet weak var btnOrder: OrderButton!
    //播放顺序点击方法
    @objc func onOrder(btn:OrderButton){
        var message:String = ""
        switch (btn.order) {
        case 1:
            message = "顺序播放"
        case 2:
            message = "随机播放"
        case 3:
            message = "单曲循环"
        default:
            message = "叮咚"
            
        }
    }

    //下一首按钮
    @IBOutlet weak var btnNext: UIButton!
    //播放按钮
    @IBOutlet weak var btnPlay: EkoButton!
    //上一首按钮
    @IBOutlet weak var btnPre: UIButton!
    //当前在播放哪一个段子
    var currIndex:Int = 0
    //播放按钮的响应方法
    @objc func onPlay(btn:EkoButton){
        if btn.isPlay{
            audioPlayer?.play()
        }else{
            audioPlayer?.pause()
        }
    }
    //上一首，下一首响应方法
    @objc func onClick(btn:UIButton){
        isAutoFinish = false
        if btn == btnNext{
            currIndex += 1
            if currIndex > self.tableData.count - 1 {
                currIndex = 0
                
            }
        }else {
            currIndex -= 1
            if currIndex < 0 {
                currIndex = self.tableData.count - 1
            }
        }
        onSelectRow(index: currIndex)
    }
    
    //创建一个媒体播放器的实例
    var audioPlayer: AVPlayer? = nil
    //定义一个变量，接收数据
    var  tableData = [JSON]()
    //网络操作类的实例
    var eHttp:HTTPController = HTTPController()
    //实现协议中定义的方法
    func didRecieveResults(results: AnyObject) {
        let json = JSON(results)
//        print(json["data"]["list"])
//        print(json)
        //存储获取到的数据 获取段子数据
        if let duanzi = json["data"]["list"].array{
            isAutoFinish = false
            self.tableData = duanzi
//            print(duanzi)
        }else{
            print("meiyoushuchu")
        }
        //刷新tv的数据
        self.tv?.reloadData()
        //获取数据后默认选择中第一条
        onSelectRow(index: 0)
        currIndex = 0
    }
    
    //设置tv的数据行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//        print(tableData.count)
        return tableData.count
    }
    //配置tv的单元格cell，填充数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //通过标识符重用cell
        let cell:UITableViewCell = tv.dequeueReusableCell(withIdentifier: "ifm")!
        //让cell背景透明
        cell.backgroundColor = UIColor.clear
        //获取cell的数据
        let rowData:JSON = tableData[indexPath.row]
        //设置cell的标题
        cell.textLabel?.text = rowData["title"].string
//        print(rowData["title"].string as Any)
        cell.detailTextLabel?.text = rowData["nickname"].string
        //设置略缩图
        cell.imageView?.image = UIImage(named: "logo")
        //封面的地址
        let url = rowData["coverSmall"].string
        //获取略缩图
        Alamofire.request(url!, method: .get).responseJSON { (data) -> Void  in
            //将获取的图像数据赋予imgView
            let img = UIImage(data: data.data! )
            cell.imageView?.image = img
        }
        
        
//        let cell = tv.dequeueReusableCell(withIdentifier: "ifm")!
//        cell.textLabel?.text = "标题：\(indexPath.row)"
//        cell.detailTextLabel?.text = "子标题：\(indexPath.row)"
//        //设置略缩图
//        cell.imageView?.image = UIImage(named: "logo")

        
        return cell
    }
    
    //设置封面
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        isAutoFinish = false
        //记录选择了第一个段子
        currIndex = indexPath.row
        onSelectRow(index: indexPath.row)
    }
    //选中了哪一行
    func onSelectRow(index:Int)  {
        //构建一个indexPath
        let indexPath = NSIndexPath(row: index, section: 0)
        //选中的效果
        tv.selectRow(at: indexPath as IndexPath, animated: false, scrollPosition: UITableView.ScrollPosition.top)
        //获取行数据
        var rowData:JSON = self.tableData[index] as JSON
        //封面的地址
        let url = rowData["coverLarge"].string
        Alamofire.request(url!, method: .get).responseJSON { (data) -> Void  in
            //将获取的图像数据赋予imgView
            let img = UIImage(data: data.data! )
            //设置圆形封面
            self.iv?.image = img
        }
        
        //获取播放地址
//        let url1 = URL(string: rowData["playUrl32"].string!)
        let urlStr = URL(string: rowData["playUrl64"].stringValue)
//        print(url1 as Any)
        if self.audioPlayer != nil {
            self.audioPlayer?.pause()
        }
        let playItem = AVPlayerItem(url: urlStr!)
        self.audioPlayer = AVPlayer(playerItem: playItem)
        self.audioPlayer?.play()
        isAutoFinish = true

    }
    
    
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var iv: EkoImage1!
    @IBOutlet weak var bg: EkoImage1!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //让圆形封面动起来
        iv.onRotation()
        //设置背景模糊
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        bg.addSubview(blurView)
        //设置歌曲列表的代理和数据源
        tv.dataSource = self
        tv.delegate = self
        //为网络操作类设置代理
        eHttp.delegate = self
        //获取段子的地址
        eHttp.onSearch(url: "http://mobile.ximalaya.com/mobile/v1/album/track?albumId=203355&device=android&isAsc=true&pageId=4&pageSize=20&statEvent=pageview%2Falbum%40203355&statModule=%E6%9C%80%E5%A4%9A%E6%94%B6%E8%97%8F%E6%A6%9C&statPage=ranklist%40%E6%9C%80%E5%A4%9A%E6%94%B6%E8%97%8F%E6%A6%9C&statPosition=8")
        //让tableView背景透明
        tv.backgroundColor = UIColor.clear
        //按钮的监听事件
        btnPlay.addTarget(self, action:#selector(self.onPlay), for: .touchUpInside)
        btnNext.addTarget(self, action:#selector(self.onClick), for: .touchUpInside)
        btnPre.addTarget(self, action:#selector(self.onClick), for: .touchUpInside)
        //对播放顺序控制按钮监听点击事件
        btnOrder.addTarget(self, action: #selector(self.onOrder(btn:)), for: .touchUpInside )
        //播放结束通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.playFinish), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: audioPlayer)
    }
    



}
