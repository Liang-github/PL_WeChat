//
//  TabBarController.swift
//  WeChat
//
//  Created by 彭亮 on 2017/4/19.
//  Copyright © 2017年 PL. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        tabBar.tintColor = UIColor(red: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
    }

    func addChildViewControllers() {
        setupOneChildViewController("微信", image: "tabbar_mainframe", selectedImage: "tabbar_mainframeHL", controller: ChatViewController())
        setupOneChildViewController("通讯录", image: "tabbar_contacts", selectedImage: "tabbar_contactsHL", controller: ContactsViewController())
        setupOneChildViewController("发现", image: "tabbar_discover", selectedImage: "tabbar_discoverHL", controller: DiscoverViewController())
        setupOneChildViewController("我", image: "tabbar_me", selectedImage: "tabbar_meHL", controller: MeViewController())
    }
    fileprivate func setupOneChildViewController(_ title: String, image: String, selectedImage: String, controller: UIViewController) {
        controller.tabBarItem.title = title
        controller.title = title
        controller.view.backgroundColor = UIColor.white
        controller.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        let nav = UINavigationController.init(rootViewController: controller)
        addChildViewController(nav)
    }

}
