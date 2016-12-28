//
//  HeaderViewCell.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bookCountLabel: UILabel!
    
    func configCell() {
        nameLabel.text = "郑佳宁"
        bookCountLabel.text = "10 本"
    }
}
