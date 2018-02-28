//
//  FlagItem.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

///Flag模型
class FlagItem: NSObject {
    
    @objc var name : String = String()
    @objc var icon : String = String()
    
    var image : UIImage = UIImage() 
    
    //自定义构造函数
    init(dict : [String : String]) {
        super.init()
        setValuesForKeys(dict)
        
        image = UIImage.init(named: icon)!
    }
    
    override init() {
        super.init()
    }

}
