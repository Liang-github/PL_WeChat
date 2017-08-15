//
//  MeViewController.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/19.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

let SCREEN_WIDTH  = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

class MeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let arr = [["相册","收藏","钱包","卡包"],["表情"],["设置"]]
    let imgArr = [["MoreMyAlbum","MoreMyFavorites","MoreMyBankCard","MyCardPackageIcon"],["MoreExpressionShops"],["MoreSetting"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    //实现协议中的方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 4
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else {
            return 44
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        
        if indexPath.section == 0 {
            let headImage: UIImageView = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
            headImage.image = UIImage(named: "siegrain_avatar")
            cell.contentView.addSubview(headImage)
            
            let label: UILabel = UILabel.init(frame: CGRect(x: 100, y: 25, width: 200, height: 20))
            label.text = "温暖你的冬"
            cell.contentView.addSubview(label)
            
            let accountLabel = UILabel.init(frame: CGRect(x: 100, y: 55, width: 200, height: 20))
            accountLabel.text = "微信号：PL8888****"
            cell.contentView.addSubview(accountLabel)
        } else {
            let imageView = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
            imageView.image = UIImage(named: imgArr[indexPath.section - 1][indexPath.row])
            cell.contentView.addSubview(imageView)
            
            let label = UILabel.init(frame: CGRect(x: 44, y: 12, width: 50, height: 20))
            label.text = arr[indexPath.section - 1][indexPath.row]
            cell.contentView.addSubview(label)
            print("试一试")
        }
        return cell
    }

}
