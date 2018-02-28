//
//  DateTextField.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

class DateTextField: UITextField {
    
    private lazy var datePick = UIDatePicker()

    override func awakeFromNib() {
        setup()
    }

    //设置日期键盘
    private func setup() {
        
        //设置日期键盘的mode
        datePick.datePickerMode = .date
        //设置地区
        datePick.locale = Locale.init(identifier: "zh")
        
        //修改textField的弹出键盘
        self.inputView = datePick
        
        //监听键盘的点击
        datePick.addTarget(self, action: #selector(dateChange), for: UIControlEvents.valueChanged)
        
    }
    
}

//MARK:- 事件监听
extension DateTextField {
    @objc func dateChange(datePick : UIDatePicker) {
        //获取日期键盘的值(date类型)
        let temp = datePick.date
        
        //date类型转成string类型
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        
        //string返回给Label
        self.text = fmt.string(from: temp)
    }
}

//MARK:- 重写父类的initWithLabelText()
extension DateTextField {
    //初始化text, 默认选择当前日期
    override func initWithLabelText() {
        dateChange(datePick: datePick)
    }
}
