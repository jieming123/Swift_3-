//
//  TestAlamofireViewController.swift
//  Swift_3+
//
//  Created by 周鑫 on 2017/7/13.
//  Copyright © 2017年 周鑫. All rights reserved.
//

import UIKit
import Alamofire

let label = UILabel()
var bgScrollView = UIScrollView()

class TestAlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Alamofire"
        self.view.backgroundColor = .white
        self.addRightBtn()
        self.testAlertCtrl()
        self.addLabel()
    }
    
    func testGet() {
        let url = "http://gaoxiaoshipin.vipappsina.com/index.php/NewApi38/index/lastId/0/random_more/0/sw/0"
        
        Alamofire.request(url).responseJSON { (response) in
            print(response)
            label.text = String(describing: response)
            label.frame = CGRect(x: 10, y: 0, width: kScreenWidth - 20, height: (label.text?.getHeightWithWidth(width: kScreenWidth - 20, font: .systemFont(ofSize: 15)))!)
            bgScrollView.contentSize = CGSize(width: kScreenWidth, height: (label.text?.getHeightWithWidth(width: kScreenWidth - 20, font: .systemFont(ofSize: 15)))!)
            print("**** **** **** ****")
        }
    }

    func testPost() {
        let url = "http://123.57.38.122/guide/index.php?m=Wap&c=Scenic&a=scenicList"
        let para = ["list" : "10", "category" : "0", "page" : "1"];
        Alamofire.request(url, method: .post, parameters: para).responseJSON { (response) in
            
//            if (response.result.isFailure) {
//                print("error = " + response.result.error!.localizedDescription)
//            } else {
//                print(response)
//            }
            
            switch response.result {
                case .success:
                    print(response)
                    label.text = String(describing: response)
                    label.frame = CGRect(x: 10, y: 0, width: kScreenWidth - 20, height: (label.text?.getHeightWithWidth(width: kScreenWidth - 20, font: .systemFont(ofSize: 15)))!)
                    bgScrollView.contentSize = CGSize(width: kScreenWidth, height: (label.text?.getHeightWithWidth(width: kScreenWidth - 20, font: .systemFont(ofSize: 15)))!)
                
                case .failure:
                    print(response.result.error!.localizedDescription)
                
            }
            print("**** **** **** ****")
        }
    }
    
    func addLabel() {
        self.automaticallyAdjustsScrollViewInsets = true
        bgScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        self.view.addSubview(bgScrollView)
        
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        bgScrollView.addSubview(label)
    }
    
    func addRightBtn() {
        let rightItemBtn = UIBarButtonItem(title: "请求", style: .plain, target: self, action: #selector(testAlertCtrl))
        self.navigationItem.rightBarButtonItem = rightItemBtn
    }
    
    func testAlertCtrl() {
        let alertCtrl = UIAlertController(title: "提示", message: "请选择请求类型", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "GET", style: .default) { (action) in
            self.testGet()
        }
        let action2 = UIAlertAction(title: "POST", style: .default) { (action) in
            self.testPost()
        }
        alertCtrl.addAction(action1)
        alertCtrl.addAction(action2)
        self.present(alertCtrl, animated: true, completion: nil)
    }
}

extension String {
    func getHeightWithWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let bound = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return bound.height
    }
    
    func getWidthWithHeight(height: CGFloat, font: UIFont) -> CGFloat {
        
        // bound方法是NSString的方法，只能提示打不出来，只能从NSString方法里拷过来
        let bound = self.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options:NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName:font], context: nil);
        return bound.width;
    }
}


























