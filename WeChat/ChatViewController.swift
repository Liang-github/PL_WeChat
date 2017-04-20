//
//  ChatViewController.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/19.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let imageArray = ["0.jpg","1.jpg","3.jpg"];
    let titleArray = ["东方时空","新闻联播","今日说法"]
    let messageArray = ["早上好","干嘛呢","你好"]
    let timeArray = ["星期一","星期二","星期三"]
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatMessageCell.init(style: .default, reuseIdentifier: nil)

        cell.headImage?.image = UIImage(named: imageArray[indexPath.row])
        cell.titleLabel?.text = titleArray[indexPath.row];
        cell.messageLabel?.text = messageArray[indexPath.row];
        cell.timeLabel?.text = timeArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
