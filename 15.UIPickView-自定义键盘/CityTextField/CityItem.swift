//
//  CityItem.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit


//城市的数据模型
@objcMembers
class CityItem: NSObject {
    
    var cities : [String] = [String]()
    var name : String = String()
    
    //自定义的构造函数
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }

}
