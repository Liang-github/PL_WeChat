//
//  ContactsViewController.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/19.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate,UISearchBarDelegate {

    let firstSectionData = [["plugins_FriendNotify","新的朋友"],["add_friend_icon_addgroup","群聊"],["Contact_icon_ContactTag","标签"],["add_friend_icon_offical","公众号"]]
    let array = ["安琪拉","李白","赵云","孙尚香","刘禅","程咬金","张飞","小乔","诸葛亮","露娜","项羽","关羽","刘备"];
    let imageArray = ["0.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg","12.jpg","13.jpg"];
    let indexArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    let letterArr = NSMutableArray()
    let nameArr = NSMutableArray()
    var set = NSSet()
    let sectionArr = NSMutableArray()
    let sectionHeadArr = NSMutableArray()
    
    func setData() {
        for str in array {
            let firstLetterString = findFirstLetterFromString(aString: str)
            letterArr.add(firstLetterString)
        }
        print("-------------\(letterArr)")
        set = NSSet.init(array: letterArr as Array)
        
        for index in 0...set.allObjects.count - 1 {
            let arr = NSMutableArray()
            let headArr = NSMutableArray()
            for i in 0...letterArr.count - 1 {
                let str = letterArr[i]
                if set.allObjects[index] as! String == str as! String {
                    let name = array[i]
                    let head = imageArray[i]
                    arr.add(name)
                    headArr.add(head)
                    
                }
            }
            sectionArr.add(arr)
            sectionHeadArr.add(headArr)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()

        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = tableHeaderView()
        tableView.rowHeight = 50
        tableView.sectionIndexBackgroundColor = UIColor.clear
        tableView.sectionIndexColor = UIColor.gray
        view.addSubview(tableView)
    }
    func tableHeaderView() -> UISearchBar {
        
        let bar = UISearchBar.init()
        bar.sizeToFit()
        bar.delegate = self
        bar.placeholder = "搜索"
        bar.showsBookmarkButton = true
        bar.setImage(UIImage(named:"VoiceSearchStartBtn"), for: .bookmark, state: .normal)
        return bar
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let headImage = UIImageView.init(frame: CGRect(x: 8, y: 8, width: 34, height: 34))
        cell.contentView.addSubview(headImage)
        
        let label = UILabel.init(frame: CGRect(x: 50, y: 15, width: 100, height: 20))
        cell.contentView.addSubview(label)
        if indexPath.section == 0 {
            headImage.image = UIImage(named: firstSectionData[indexPath.row][0])
            label.text = firstSectionData[indexPath.row][1]
        } else {
            let arr = sectionHeadArr[indexPath.section - 1]
            let imageName = (arr as AnyObject)[indexPath.row]
            headImage.image = UIImage(named: imageName as! String)
            label.text = (sectionArr[indexPath.section - 1] as AnyObject)[indexPath.row] as? String
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return set.allObjects.count + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        if section == 0 {
            return 4
        } else {
            let arr = sectionArr[section - 1]
            
            return (arr as AnyObject).count
        }
        
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return set.allObjects as? [String]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            return set.allObjects[section - 1] as? String
        }
        
    }
    

    //获取联系人昵称的大写拼音首字母大写
    func findFirstLetterFromString(aString: String) -> String {
        //转变成可变字符串
        let mutableString = NSMutableString.init(string: aString)
        //将中文转换成带声调的拼音
        CFStringTransform(mutableString as CFMutableString, nil, kCFStringTransformToLatin, false)
        //去掉声调，提高遍历速度
        let pinyinString = mutableString.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
        //将拼音首字母换成大写
        let strPinYin = polyphoneStringHandle(nameString: aString, pinyinString: pinyinString).uppercased()
        //截取大写首字母
        let firstString = strPinYin.substring(to: strPinYin.index(strPinYin.startIndex, offsetBy: 1))
        //判断昵称首字母是否为大写
        let regexA = "^[A-Z]$"
        let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
        return predA.evaluate(with: firstString) ? firstString : "#"
    }
    
    //多音字处理
    func polyphoneStringHandle(nameString: String, pinyinString: String) -> String {
        if nameString.hasPrefix("长") {return "chang"}
        if nameString.hasPrefix("沈") {return "shen"}
        if nameString.hasPrefix("厦") {return "xia"}
        if nameString.hasPrefix("地") {return "di"}
        if nameString.hasPrefix("重") {return "chong"}
        
        return pinyinString
    }
}
