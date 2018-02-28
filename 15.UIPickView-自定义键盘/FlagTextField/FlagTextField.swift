//
//  FlagTextField.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

class FlagTextField: UITextField {
    
    //自定义的属性
    private lazy var pickView = UIPickerView()
    
    //MARK:- 加载plist文件的数据 -
    private var flagArray : [FlagItem] {
        
        let path = Bundle.main.path(forResource: "flags", ofType: "plist")
        
        var tempArray = [FlagItem]()
        if path != nil {
            let array = NSArray.init(contentsOfFile: path!)
            
            if array != nil {
                for tempDict in array! {
                    let flagItem = FlagItem.init(dict: tempDict as! [String : String])
                    tempArray.append(flagItem)
                }
            }
//            print(tempArray)
        }
        
        return tempArray
    }

    //系统回调的函数
    override func awakeFromNib() {
        setup()
    }
    
    
    //设置键盘
    func setup() {
        
        pickView.dataSource = self
        pickView.delegate = self
        
        //修改textField的弹出键盘
        self.inputView = pickView
    }
    
}

//MARK:- FlagTextField的数据源和代理方法
extension FlagTextField : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flagArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let flagItemView = FlagItemView.flagView() as! FlagItemView
        
        //设置View的属性
        let item : FlagItem =  flagArray[row]
        flagItemView.item = item
        
        return flagItemView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item : FlagItem =  flagArray[row]
        self.text = item.name
    }
}

//MARK:- 重写父类的initWithLabelText()
extension FlagTextField {
    //初始化text, 默认选择第0列第0行
    override func initWithLabelText() {
        self.pickerView(pickView, didSelectRow: 0, inComponent: 0)
    }
}

