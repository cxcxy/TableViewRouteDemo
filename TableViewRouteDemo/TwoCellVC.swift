//
//  TwoCellVC.swift
//  TableViewRouteDemo
//
//  Created by 陈旭 on 2016/11/9.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit
protocol TwoCellDelegate:class {
    
    func TwoDEL()
    
}
class TwoCellVC: UITableViewCell {
    
   weak var delegate : TwoCellDelegate?
    
    @IBOutlet weak var tttLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnAction(_ sender: Any) {
        if let del = delegate {
            del.TwoDEL()
        }
    }

    @IBOutlet weak var btnClick: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
