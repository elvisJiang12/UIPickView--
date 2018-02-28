//
//  ViewController.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/27.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countryTextF: UITextField!
    @IBOutlet var birthTextF: UITextField!
    @IBOutlet var cityTextF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTextF.delegate = self
        birthTextF.delegate = self
        cityTextF.delegate = self
    }



}

//MARK:- UITextFieldDelegate的代理方法
extension ViewController : UITextFieldDelegate {
    
    //设置textField是否允许用户手动输入
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    //textField开始编辑时调用
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.initWithLabelText()
    }
}

