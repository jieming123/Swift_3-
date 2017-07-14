//
//  ViewController.swift
//  Swift_3+
//
//  Created by 周鑫 on 2017/7/13.
//  Copyright © 2017年 周鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Swift"
        
        let alamofire_btn = UIButton(type: .custom)
        alamofire_btn.setTitle("Alamofire", for: .normal)
        alamofire_btn.setTitleColor(.red, for: .normal)
        alamofire_btn.layer.cornerRadius = 5.0
        alamofire_btn.layer.borderColor = UIColor.red.cgColor
        alamofire_btn.layer.borderWidth = 1.0
        alamofire_btn.addTarget(self, action: #selector(gotoAlamofireCtrl), for: .touchUpInside)
        alamofire_btn.frame = CGRect(x: 100, y: 100, width: kScreenWidth - 200, height: 30)
        self.view.addSubview(alamofire_btn)
        
        let x = "str"
        // 判断条件成立，则继续执行下面语句，不成立则执行else语句,并return,guard 语法都可以用 if 代替，什么时候用guard或if，依据代码可读性和上下文判断
        guard x == "str" else {
            print("yes")
            return 
        }
        print("no")
    }
    
    func gotoAlamofireCtrl() {
        let ctrl = TestAlamofireViewController()
        self.navigationController?.pushViewController(ctrl, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

