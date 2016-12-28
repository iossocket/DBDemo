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
    
    func configCell(userInfo: (name: String, count: String)) {
        nameLabel.text = userInfo.name
        bookCountLabel.text = userInfo.count
    }
}
