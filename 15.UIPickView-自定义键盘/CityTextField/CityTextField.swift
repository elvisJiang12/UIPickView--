//
//  CityTextField.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

class CityTextField: UITextField {
    
    //自定义的属性, 存储选择的省会的行下标值
    private lazy var pickView = UIPickerView()
    private lazy var index : Int = 0
    
    //懒加载plist数据
    private var dataArray : [CityItem] {
        let path = Bundle.main.path(forResource: "provinces.plist", ofType: nil)
        
        var tempArray = [CityItem]()
        if path != nil {
            let dictArray = NSArray.init(contentsOfFile: path!) as! [[String : Any]]
        
            for dict in dictArray {
                let cityItem = CityItem.init(dict: dict)
                tempArray.append(cityItem)
            }
        }
        
        return tempArray
        
    }

    //MARK:- 系统回调的函数
    override func awakeFromNib() {
        setup()
    }
    
    //设置键盘
    private func setup() {
        
        pickView.dataSource = self
        pickView.delegate = self
        
        self.inputView = pickView
    }

}

extension CityTextField : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //设置省会的行数
        if component == 0 {
            return dataArray.count
        } else {
            //设置城市的行数
            return dataArray[index].cities.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            index = row
            
            //修改省会值时, 城市自动选择第0行
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            //刷新pickView的数据
            pickerView.reloadAllComponents()
            
        }
        
        
        //设置Label的数据
        let provinceName = dataArray[index].name
        
        let selectedCityIndex = pickerView.selectedRow(inComponent: 1)
        let cityName = dataArray[index].cities[selectedCityIndex]
        
        self.text = provinceName + "省 - " + cityName + "市"
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dataArray[row].name
        } else {
            //设置城市的行数
            return dataArray[index].cities[row]
        }
    }
    
    
}


//MARK:- 重写父类的initWithLabelText()
extension CityTextField {
    //初始化text, 默认选择第0列第0行
    override func initWithLabelText() {
        
        pickerView(pickView, didSelectRow: 0, inComponent: 0)
    }
}
