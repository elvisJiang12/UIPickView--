//
//  FlagItemView.swift
//  15.UIPickView-自定义键盘
//
//  Created by Elvis on 2018/2/28.
//  Copyright © 2018年 Elvis. All rights reserved.
//

import UIKit

class FlagItemView: UIView {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    //自定义的属性
    var item : FlagItem = FlagItem.init() {
        didSet {
            self.nameLabel.text = item.name
            self.imageView.image = item.image
        }
    }

    class func flagView() -> UIView {
        
        let view = Bundle.main.loadNibNamed("FlagItemView", owner: nil, options: nil)?.first as! UIView
        view.bounds.size.width = UIScreen.main.bounds.size.width
        
        return view
    }
    
    
    
    
}
