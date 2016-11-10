//
//  ViewController.swift
//  TableViewRouteDemo
//
//  Created by 陈旭 on 2016/11/9.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit
public extension UIStoryboard {
    /**
     根据stroyboard名称返回初始控制器
     
     - parameter name: 名称
     
     - returns: 初始控制器
     */
    class func initialViewController(_ name: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
    
    /**
     根据stroyboard名称和标示符返回对应的控制器
     
     - parameter name:       名称
     - parameter identifier: 标示符
     
     - returns: 对应的控制器
     */
    class func initialViewController(_ name: String, identifier: String) -> UIViewController
    {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateViewController(withIdentifier: identifier)
    }
    
}
public extension UINib{
    
    class func nibName(_ name:String) ->UINib{
        return UINib(nibName: name, bundle: Bundle.main)
    }
}


class ViewController: UIViewController,NoneCellDelegate,TwoCellDelegate {
    internal func textDEL() {
        print("aaa")
    }
    internal func TwoDEL() {
        print("bbb")
    }
    @IBOutlet var dataDelegate: WOWDataSource?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.red
//        "NoneCellVC"
         tableView.register(UINib.nibName("NoneCellVC"), forCellReuseIdentifier:"NoneCellVC")
         tableView.register(UINib.nibName("TwoCellVC"), forCellReuseIdentifier:"TwoCellVC")
        dataDelegate?.dataSourceArray = self.catalog
        //设置estimatedRowHeight属性默认值
        self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        dataDelegate?.vc = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    lazy var catalog:[String] = {
        
        let a1 =
                  "由于Swift开发环境需要在OS X系统中运行，下面就一起来学习一下swift开发环境的搭建方法。本节介绍Swift中一些常用的关键字。以及引入、注释等相关操作。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。"
        let a2 =
                  "本节介绍Swift中一些常用的关键字。以及引入、注释等相关操作。"
        let a3 =
                  "本节介绍Swift中一些常用的关键字。以及引入、注释等相关操作。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。"
        let a4 =
                  "本节介绍Swift中一些常用的关键字。以及引入、注释等相关操作。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。"
        let a5 =
                  "本节介绍Swift中一些常用的关键字。以及引入、注释等相关操作。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。nt、UInt、浮点数、布尔值、字符串、字符等等。"
        
        return [a1,a2,a3,a4,a5]
    }()

}

class WOWDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    open var vc : UIViewController?
    open var dataSourceArray : [String]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataSourceArray?.count ?? 0
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2{
            let cell                = tableView.dequeueReusableCell(withIdentifier: "TwoCellVC", for: indexPath) as! TwoCellVC
            
            
            cell.delegate      = self.vc as! TwoCellDelegate?
            cell.tttLB.text = dataSourceArray?[indexPath.section]
            
            
            return cell

        
        }else{
            
            let cell                = tableView.dequeueReusableCell(withIdentifier: "NoneCellVC", for: indexPath) as! NoneCellVC
            
            cell.delegate      = self.vc as! NoneCellDelegate?
            
         
            
            return cell

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("111")


        let secondVc = testVC()
        vc?.navigationController?.pushViewController(secondVc, animated: true)
    }
}
