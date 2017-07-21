//
//  HotHouse.swift
//  MoGuTest
//
//  Created by 薛孟杰 on 2017/7/21.
//  Copyright © 2017年 薛孟杰. All rights reserved.
//

import UIKit

class HotHouse: UIControl {

    var titlelabel     : UILabel!
    var imageView      : UIImageView!
    var addressLabel   : UILabel!
    var moneyLaebl     : UILabel!
    
    init(frame: CGRect, dic:Dictionary<String, Any>) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 164, height: 80))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        
        titlelabel = UILabel(frame:CGRect(x: 0, y: 10, width: 165, height: 20))
        titlelabel.textColor = UIColor.white
        titlelabel.text = "张三"
        titlelabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(titlelabel)
        
        addressLabel = UILabel(frame:CGRect(x: 0, y: 50, width: 164, height: 10))
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.text = "地址:上海"
        self.addSubview(addressLabel)
        
        moneyLaebl = UILabel(frame:CGRect(x: 0, y: 65, width: 164, height: 10))
        moneyLaebl.font = UIFont.systemFont(ofSize: 12)
        moneyLaebl.text = "租金: ¥2000"
        self.addSubview(moneyLaebl)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }


}
