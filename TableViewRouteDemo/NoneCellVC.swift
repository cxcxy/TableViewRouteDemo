//
//  NoneCellVC.swift
//  TableViewRouteDemo
//
//  Created by 陈旭 on 2016/11/9.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit
protocol NoneCellDelegate:class {
 
    func textDEL()
    
}

class NoneCellVC: UITableViewCell {
    
    @IBOutlet weak var imgTest: UIImageView!
    weak var delegate : NoneCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgTest.isUserInteractionEnabled = true
        
    }

    @IBAction func clickAction(_ sender: Any) {
        if let del = delegate {
            del.textDEL()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
