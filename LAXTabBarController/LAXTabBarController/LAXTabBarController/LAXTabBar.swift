//
//  LAXTabBar.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/15.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

protocol LAXTabBarDelegate {
    func tabBarDidSelectItem(index: Int)
}

class LAXTabBar: UIView {
    
    var size = UIScreen.main.bounds.size {
        didSet {
            self.frame = CGRect.init(x: 0, y: size.height - 49, width: size.width, height: 49)
            setItemsFrame()
        }
    }
    
    var items: Array<UIButton> = []
    
    var itemsName: Array<String> = [] {
        willSet {
            removeItems()
        }
        didSet {
            addItems()
        }
    }
    
    var itemsImage: Array<String> = [] {
        didSet {
            setItemsImage()
        }
    }
    
    var itemsSelectedImage:Array<String> = [] {
        didSet {
            setItemsSelectedImage()
        }
    }
    
    var selectedIndex: Int = 0 {
        willSet {
            if items.count > selectedIndex {
                items[selectedIndex].isSelected = false
            }
        }
        didSet {
            if items.count > selectedIndex {
                items[selectedIndex].isSelected = true
            }
        }
    }
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: size.height, width: size.width, height: 49))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size = frame.size
    }
    
    convenience init(delegate: LAXTabBarDelegate) {
        self.init()
        self.tabBarDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeItems() {
        for item in items {
            item.removeFromSuperview()
        }
        items = []
    }
    
    func addItems() {
        for i in 0..<itemsName.count {
            let btn = UIButton.init()
            btn.tag = i
            
            btn.setTitle(itemsName[i], for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.orange, for: .selected)
            btn.addTarget(self, action: #selector(didselectItemAction(sender:)), for: .touchUpInside)
            self.addSubview(btn)
            self.items.append(btn)
            
            if itemsName[i] == "" {
                btn.isEnabled = false
            }
        }
        setItemsFrame()
        setItemsImage()
        setItemsSelectedImage()
    }
    
    func setItemsFrame() {
        let w = size.width / (CGFloat)(itemsName.count)
        for i in 0..<items.count {
            let btn = items[i]
            btn.frame = CGRect.init(x: (CGFloat)(i) * w, y: 0, width: w, height: 49)
            
            if i == selectedIndex {
                btn.isSelected = true
            }
        }
    }
    
    func setItemsImage() {
        for i in 0..<itemsImage.count {
            if i < items.count {
                items[i].setImage(UIImage.init(named: itemsImage[i]), for: .normal)
            }
        }
    }
    
    func setItemsSelectedImage() {
        for i in 0..<itemsSelectedImage.count {
            if i < items.count {
                items[i].setImage(UIImage.init(named: itemsSelectedImage[i]), for: .selected)
            }
        }
    }
    
    //tabBar Delegate
    var tabBarDelegate: LAXTabBarDelegate?
    
    func didselectItemAction(sender: UIButton) {
        print("\ntabbar didselect index:", sender.tag)
        self.selectedIndex = sender.tag
        self.tabBarDelegate?.tabBarDidSelectItem(index: sender.tag)
    }
    
}
