//
//  ChatMessageCell.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/20.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    var headImage: UIImageView?
    var titleLabel: UILabel?
    var messageLabel: UILabel?
    var timeLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headImage = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        headImage?.clipsToBounds = true
        headImage?.layer.cornerRadius = 5
        contentView.addSubview(headImage!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 60, y: 10, width: 200, height: 20))
        contentView.addSubview(titleLabel!)
        
        messageLabel = UILabel.init(frame: CGRect(x: 60, y: 30, width: 200, height: 20))
        messageLabel?.textColor = UIColor.gray
        messageLabel?.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(messageLabel!)
        
        timeLabel = UILabel.init(frame: CGRect(x: SCREEN_WIDTH - 100, y: 10, width: 80, height: 20))
        timeLabel?.textAlignment = .right
        timeLabel?.textColor = UIColor.gray
        timeLabel?.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(timeLabel!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
