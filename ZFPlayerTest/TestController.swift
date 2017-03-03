//
//  TestController.swift
//  ZFPlayerTest
//
//  Created by xiaohui on 2017/3/1.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class TestController: UITableViewController {

    static let cellIdentifier = "cell"
    
    lazy var playerView: ZFPlayerView = {
        let pv = ZFPlayerView.shared()
        return pv!
    }()
    
    lazy var controlView: ZFPlayerControlView = {
        let cv = ZFPlayerControlView()
        return cv
    }()
    
    var titleArray = [String]()
    
    var dataSource = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        playerView.resetPlayer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(TestCell.self, forCellReuseIdentifier: identifier)

        titleArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        dataSource = ["http://baobab.wdjcdn.com/14571455324031.mp4", "http://baobab.wdjcdn.com/14559682994064.mp4", "http://baobab.wdjcdn.com/1458625865688ONE.mp4", "http://baobab.wdjcdn.com/14573563182394.mp4", "http://baobab.wdjcdn.com/1454467934808B(9).mp4", "http://baobab.wdjcdn.com/1458389678814huanjieyaliBastaw_x264.mp4", "http://baobab.wdjcdn.com/1457716884751linghunbanlv_x264.mp4", "http://baobab.wdjcdn.com/14587093851044544c.mp4", "http://baobab.wdjcdn.com/1455861661073g.mp4", "http://baobab.wdjcdn.com/14557771465491(9).mp4"]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifierDynamic = TestController.cellIdentifier + String(indexPath.row)
        
        var cell = tableView .dequeueReusableCell(withIdentifier: cellIdentifierDynamic) as? TestCell
        
        if cell == nil {
            cell = TestCell(style: .default, reuseIdentifier: cellIdentifierDynamic)
        }
        
        cell?.titleLabel.text = titleArray[indexPath.row]
        
        let videoURL = NSURL(string: dataSource[indexPath.row])

        cell?.playBtnHandler = { [weak self] in
            
            guard let weakSelf = self else {
                return
            }

            let playerModel = ZFPlayerModel()
            playerModel.videoURL = videoURL as URL!
            playerModel.tableView = weakSelf.tableView
            playerModel.indexPath = indexPath
            playerModel.fatherView = cell?.picView
            
//            weakSelf.playerView.resetPlayer()
            weakSelf.playerView.playerControlView(weakSelf.controlView, playerModel: playerModel)
            weakSelf.playerView.autoPlayTheVideo()
            weakSelf.playerView.cellPlayerOnCenter = false
        }
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
