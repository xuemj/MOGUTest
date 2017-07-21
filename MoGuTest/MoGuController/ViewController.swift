//
//  ViewController.swift
//  MoGuTest
//
//  Created by 薛孟杰 on 2017/7/21.
//  Copyright © 2017年 薛孟杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    var mainView : UITableView!
    //数据源数组格式具体看服务端返回数据结构
    var dataArr1 :Array<Dictionary<String,String>>!
    var dataArr2 :Array<Dictionary<String,String>>!
    var dataArr3 :Array<Dictionary<String,String>>!
    var dataArr4 :Array<Dictionary<String,String>>!
    var dataArr5 :Array<Dictionary<String,String>>!
    var urlArr   :Array<String>!       //接口url数组
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailView()
    }
 
    
    
    
//AFNetworking、Alamofire或者自己封装的NSURLSession
//使用gcd多线程下载数据，没有接口所以只是写了方法，自己拼装了假数据，在每个线程执行完毕返回数据后在主线程为数据源赋值，并且刷新对应cell的UI,整个流程大概就是这样。
// 因为没有具体接口，部分方法里类型未转化，所以注销了多线程请求的方法，思路就是这样，利用多线程下载数据，防止下载过程中UI阻塞，并且提高cpu利用率，下载完成后主线程更新UI,当然如果加载图片或者文字很多，优化可以参考YYkit之类
    
    func loadDataThread() -> Void {
//        for i:Int in 0..<4{
//            DispatchQueue.global().async {
//                self.loadData(index: i)
//            }
//        }
        
    }
// 得到的 index对应的data就是某一条cell里的数据源，将data转化为json对A1，A2...赋值，然后刷新index对应的cell UI
    func loadData(index :Int) -> Void {
        
//        var data:NSData = self.requestData(index: index)
//        DispatchQueue.main.async {
//            switch index{
//            case 0:
//                dataArr1 = data
//            case 1:
//                dataArr2 = data
//            case 2:
//                dataArr3 = data
//            case 3:
//                dataArr4 = data
//            case 4:
//                dataArr5 = data
//            default:
//            }
//            let indexpath:IndexPath = IndexPath(row:index,section:0)
//            self.mainView.reloadRows(at: [indexpath], with: .fade)
//            
//        }

    }
    func requestData(index :Int) -> NSData {
        let url = NSURL(string: "xxx")!
        let data = NSData (contentsOf: url as URL)
        return data!
    }

    
  
    
    
    func detailView() {
        self.title = "MoGu"
        mainView = UITableView(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        mainView.delegate = self
        mainView.dataSource = self
        self.view.addSubview(mainView)
        mainView.register(UINib.init(nibName: "MoreServiceTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ServiceIdentifer")
        mainView.register(UINib.init(nibName: "HotCityTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cityIdentifer")
        mainView.register(UINib.init(nibName: "HotHouseTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "houseIdentifer")
        mainView.register(UINib.init(nibName: "HotApartmentTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "apartmentIdentifer")
        mainView.register(UINib.init(nibName: "HotHotelTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "hotelIdentifer")
        // 开启多线程并发请求
        // self.loadDataThread();
        //加载假数据
        self.loadDemoData()
    }
    func loadDemoData() {
       dataArr1 = [
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"]
        ]
        dataArr2 = [
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"]
        ]
        dataArr3 = [
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"]
        ]
        dataArr4 = [
        ["name":"张三","address":"22","money":"1200","image":"moren"]
        ]
        dataArr5 = [
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"],
        ["name":"张三","address":"22","money":"1200","image":"moren"]
        ]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : MoreServiceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServiceIdentifer") as! MoreServiceTableViewCell
            
            cell .configCell(arr: dataArr1 )
            return cell
            
        }else if indexPath.section == 1{
            let cell : HotCityTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cityIdentifer") as! HotCityTableViewCell
            cell .configCell(arr: dataArr2)
            return cell
        }else if indexPath.section == 2{
            let cell : HotApartmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "apartmentIdentifer") as! HotApartmentTableViewCell
            cell.sendblack = myApartmentSend(index:)
            
            cell .configCell(arr: dataArr3)
            return cell
        }else if indexPath.section == 3{
            let cell : HotHotelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "hotelIdentifer") as! HotHotelTableViewCell
            
            cell .configCell(arr: dataArr4 )
            return cell
        }
        else{
            let cell : HotHouseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "houseIdentifer") as! HotHouseTableViewCell
            
            cell .configCell(arr: dataArr5)
            return cell
            
        }
    }
    func myApartmentSend(index :Int)->Void{
        print("公寓index = ",index)
        //跳转公寓index详情页
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

