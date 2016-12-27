//
//  BookViewCell.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

class BookViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configCell(_ book: Book) {
        nameLabel.text = book.name
        authorLabel.text = book.author
        statusLabel.text = book.displayedStatus
    }

}
