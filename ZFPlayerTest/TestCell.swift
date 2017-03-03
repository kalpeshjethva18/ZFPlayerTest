//
//  TestCell.swift
//  ZFPlayerTest
//
//  Created by xiaohui on 2017/3/1.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    var titleLabel: UILabel!
    var picView: UIImageView!
    var playBtn: UIButton!
//    var playBtnHandler: ((_ btn: UIButton) -> Void)?
    var playBtnHandler: (() -> Void)?

    
//    var model = ZFVideoModel() {
//        didSet {
//            picView.sd_setImage(with: NSURL(string: model.coverForFeed) as URL?, placeholderImage: UIImage(named: "loading_bgView"))
//        }
//    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        picView = UIImageView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 300))
        picView.sd_setImage(with: NSURL(string: "") as URL?, placeholderImage: UIImage(named: "loading_bgView"))
//        picView.tag = 101
        picView.isUserInteractionEnabled = true
        addSubview(picView)
        
        playBtn = UIButton(type: .custom)
        playBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        playBtn.setImage(UIImage(named: "video_list_cell_big_icon"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
        picView.addSubview(playBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func playBtnClicked() {
        if let playBtnHandler = playBtnHandler {
            playBtnHandler()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
