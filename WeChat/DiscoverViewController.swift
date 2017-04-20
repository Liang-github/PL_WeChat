//
//  DiscoverViewController.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/19.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let titleArray = [["朋友圈"],["扫一扫","摇一摇"],["附近的人","漂流瓶"],["购物","游戏"],["小程序"]]
    let imageArray = [["ff_IconShowAlbum"],["ff_IconQRCode","ff_IconShake"],["ff_IconLocationService","ff_IconBottle"],["CreditCard_ShoppingBag","MoreGame"],["FootStep"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 || section == 2 || section == 3 {
            return 2
        } else if section == 4 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        
        let imageView = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        imageView.image = UIImage(named: imageArray[indexPath.section][indexPath.row])
        cell.contentView.addSubview(imageView)
        
        let label = UILabel.init(frame: CGRect(x: 44, y: 12, width: 100, height: 20))
        label.text = titleArray[indexPath.section][indexPath.row]
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let qrcodeVC = QRCodeScanViewController()
                navigationController?.pushViewController(qrcodeVC, animated: true)
            }
        }
    }
}
