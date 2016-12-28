//
//  ViewController.swift
//  DBDemo
//
//  Created by XueliangZhu on 12/19/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var bookDataCenter = BookDataCenter()
    var bookViewModel: BookListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "My Books"
        
        let books = bookDataCenter.fetchBooksFromBD(notificationHandler: booksChangedNotificationHandler())
        bookViewModel = BookListViewModel(books: books)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.bookCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewCell", for: indexPath) as! BookViewCell
        let book = bookViewModel.bookAtIndex(indexPath.row)
        cell.configCell(book)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookViewModel.bookAtIndex(indexPath.row)
        if let selectedBook = bookDataCenter.fetchBookById(book.id) {
            let bookDetailViewModel = BookDetailViewModel(book: selectedBook)
            
            let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailVC.bookDetailViewModel = bookDetailViewModel
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    private func booksChangedNotificationHandler() -> ((_ type: NotificationType) -> Void) {
        return { [weak self] type in
            guard let strongSelf = self else { return }
            
            switch type {
                case .initial(let value):
                    strongSelf.bookViewModel = BookListViewModel(books: value)
                    strongSelf.tableView.reloadData()
                case .modifications(let modifiededIndexes, let value):
                    strongSelf.bookViewModel = BookListViewModel(books: value)
                    
                    strongSelf.tableView.beginUpdates()
                    strongSelf.tableView.reloadRows(at: modifiededIndexes.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    strongSelf.tableView.endUpdates()
            }
        }
    }
}

