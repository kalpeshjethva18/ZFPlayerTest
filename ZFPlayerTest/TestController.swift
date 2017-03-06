//
//  TestController.swift
//  ZFPlayerTest
//
//  Created by xiaohui on 2017/3/1.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class TestController: UITableViewController {
    
    lazy var playerView: ZFPlayerView = {
        let pv = ZFPlayerView.shared()
        return pv!
    }()
    
    lazy var controlView: ZFPlayerControlView = {
        let cv = ZFPlayerControlView()
        return cv
    }()
    
    var titleArray = [String]()
    
    var modelList = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleArray = ["风格互换：原来你我相爱",
                      "朋友圈中的你是真实的你吗？",
                      "「海贼王：燃烧之血」CG 预告",
                      "吐司君的花样吃法",
                      "BMX自行车特技：娴熟如跑酷",
                      "国际睡眠日：昨晚睡得好吗？",
                      "你相信有灵魂伴侣吗",
                      "死神刺杀计划",
                      "主人，我熟悉你的每一部分",
                      "一段相差 57 岁的人生问答"]
        
        modelList = ["http://baobab.wdjcdn.com/14571455324031.mp4",
                     "http://baobab.wdjcdn.com/14559682994064.mp4",
                     "http://baobab.wdjcdn.com/1458625865688ONE.mp4",
                     "http://baobab.wdjcdn.com/14573563182394.mp4",
                     "http://baobab.wdjcdn.com/1454467934808B(9).mp4",
                     "http://baobab.wdjcdn.com/1458389678814huanjieyaliBastaw_x264.mp4",
                     "http://baobab.wdjcdn.com/1457716884751linghunbanlv_x264.mp4",
                     "http://baobab.wdjcdn.com/14587093851044544c.mp4",
                     "http://baobab.wdjcdn.com/1455861661073g.mp4",
                     "http://baobab.wdjcdn.com/14557771465491(9).mp4"]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifierDynamic = "cell" + String(indexPath.row) // 动态的cell标识
        
        var cell = tableView .dequeueReusableCell(withIdentifier: cellIdentifierDynamic) as? TestCell
        
        if cell == nil {
            cell = TestCell(style: .default, reuseIdentifier: cellIdentifierDynamic)
        }
        
        cell?.titleLabel.text = titleArray[indexPath.row]
        
        let videoURL = NSURL(string: modelList[indexPath.row])

        cell?.playBtnHandler = { [weak self] in
            
            guard let weakSelf = self else {
                return
            }

            let playerModel = ZFPlayerModel()
            playerModel.videoURL = videoURL as URL!
            playerModel.tableView = weakSelf.tableView //（列表播放，且当cell不在可视范围内时可进行小窗口续播）
            playerModel.indexPath = indexPath
            playerModel.fatherView = cell?.picView
            
//            weakSelf.playerView.resetPlayer() // 重置播放器（列表播放，若不需小窗口续播则必须加上此句代码，反之，不必须）
            weakSelf.playerView.playerControlView(weakSelf.controlView, playerModel: playerModel) // 指定播放的控制层和模型
            weakSelf.playerView.autoPlayTheVideo()
        }
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
