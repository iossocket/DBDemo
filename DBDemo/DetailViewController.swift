//
//  DetailViewController.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let bookDataCenter = BookDataCenter()
    var bookDetailViewModel: BookDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        title = "Book Detail"
        
        nameLabel.text = bookDetailViewModel.name()
        authorLabel.text = bookDetailViewModel.author()
        statusLabel.text = bookDetailViewModel.status()
    }
    
    @IBAction func changeStatus(_ sender: Any) {
        bookDataCenter.changeBookStatus(bookDetailViewModel.bookID()) { [weak self] book in
            if let strongSelf = self {
                strongSelf.statusLabel.text = book.displayedStatus
            }
        }
    }

}
