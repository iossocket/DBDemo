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
    
    var bookID: Int!
    var bookViewModel: BookViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        title = "Book Detail"
        
        let book = bookViewModel.fetchBookById(bookID)
        nameLabel.text = book.name
        authorLabel.text = book.author
        statusLabel.text = book.status
    }
    
    @IBAction func changeStatus(_ sender: Any) {
        bookViewModel.changeBookStatus(bookID) { [weak self] book in
            if let strongSelf = self {
                strongSelf.statusLabel.text = book.displayedStatus
            }
        }
    }

}
