//
//  SecondVC.swift
//  TableViewRouteDemo
//
//  Created by 陈旭 on 2016/11/9.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit

class SecondVC: UIViewController,NoneCellDelegate,TwoCellDelegate {
    internal func textDEL() {
        print("bbb")
    }
    internal func TwoDEL() {
        print("ccc")
    }
    @IBOutlet var dataDelegate: WOWDataSource?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.

        tableView.register(UINib.nibName("NoneCellVC"), forCellReuseIdentifier:"NoneCellVC")
        tableView.register(UINib.nibName("TwoCellVC"), forCellReuseIdentifier:"TwoCellVC")
        dataDelegate?.vc = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
