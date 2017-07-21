//
//  MoreServiceTableViewCell.swift
//  MoGuTest
//
//  Created by 薛孟杰 on 2017/7/21.
//  Copyright © 2017年 薛孟杰. All rights reserved.
//

import UIKit

class MoreServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var scView: UIScrollView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(arr:Array<Dictionary<String, Any>>) -> Void {
        scView.backgroundColor = UIColor.white
        scView.showsHorizontalScrollIndicator = false
        scView.alwaysBounceHorizontal = true;
        let chilrenviews = scView.subviews
        for chilren in chilrenviews {
            chilren.removeFromSuperview()
        }
        for i:Int in 0..<arr.count{
            let item : HotHouse = HotHouse.init(frame: CGRect(x: 20 + 174*i, y: 0, width: 164 , height: 93), dic: arr[i])
            item.tag = i+1000
            item.titlelabel.text = arr[i]["name"] as? String
            item.addressLabel.text = arr[i]["address"] as? String
            item.imageView.image = UIImage.init(named: arr[i]["image"] as! String)
            item.moneyLaebl.text = arr[i]["money"] as? String
            
            item.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
            scView.addSubview(item)
        }
        scView.contentSize = CGSize(width: 180 * arr.count, height: 0)
    }
    func click(_ btn:UIControl) {
        print(btn.tag-1000)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
