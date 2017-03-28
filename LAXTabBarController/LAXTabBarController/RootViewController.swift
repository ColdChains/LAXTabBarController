//
//  RootViewController.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

class RootViewController: LAXTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.addViewController()
        
    }
    
    func addViewController() {
        
        let vc1 = MainViewController()
        let vc2 = AttentionViewController()
        let vc3 = LiveViewController()
        let vc4 = AttentionViewController()
        let vc5 = MineViewController()
        
        vc1.view.backgroundColor = UIColor.blue
        vc2.view.backgroundColor = UIColor.orange
        vc3.view.backgroundColor = UIColor.yellow
        vc4.view.backgroundColor = UIColor.red
        vc5.view.backgroundColor = UIColor.green
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        laxTabBar?.itemsName = ["首页", "关注", "直播", "社区", "我的"]
        laxTabBar?.itemsImage = ["btn_home_normal", "btn_attention_normal", "btn_live_normal", "btn_search_normal", "btn_user_normal"]
        laxTabBar?.itemsSelectedImage = ["btn_home_selected", "btn_attention_selected", "btn_live_selected", "btn_search_selected", "btn_user_selected"]
        
        
    }
    
}
