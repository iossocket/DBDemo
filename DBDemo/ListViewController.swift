//
//  ViewController.swift
//  DBDemo
//
//  Created by XueliangZhu on 12/19/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

extension UITableViewController {
    func reloadSectionZero(modifiededIndexes: [Int]) {
        tableView.beginUpdates()
        tableView.reloadRows(at: modifiededIndexes.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
        tableView.endUpdates()
    }
}

class ListViewController: UITableViewController {

    let bookDataService: BookDataService = RealmBookDataService(transform: RealmBookToBookTransform())
    let userDataService: UserDataService = RealmUserDataService()
    let bookNotificationCenter: BookNotificationCenter = RealmBookNotificaitonCenter(transform: RealmBookToBookTransform())
    
    var viewModel: BookListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "My Books"
        showBooks()
        refreshWhenDataChanged()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewCell", for: indexPath) as! BookViewCell
        let book = viewModel.bookAtIndex(indexPath.row)
        cell.configCell(book)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = viewModel.bookAtIndex(indexPath.row)
        
        if let selectedBook = bookDataService.fetchBookById(book.id) {
            let bookDetailViewModel = BookDetailViewModel(book: selectedBook)
            
            let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailVC.bookDetailViewModel = bookDetailViewModel
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell") as! HeaderViewCell
        cell.configCell(userInfo: viewModel.userInfo())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    // MARK: private
    
    func showBooks() {
        let books = bookDataService.fetchBooksFromBD()
        let user = userDataService.fetchUser()
        viewModel = BookListViewModel(books: books, user: user)
        tableView.reloadData()
    }
    
    func refreshWhenDataChanged() {
        let user = userDataService.fetchUser()
        bookNotificationCenter.register(deletionHandler: { [weak self] books, indexes in
            guard let strongSelf = self else { return }
            strongSelf.viewModel = BookListViewModel(books: books, user: user)
            strongSelf.reloadSectionZero(modifiededIndexes: indexes)
            }, insertionHandler: { [weak self] books, indexes in
                guard let strongSelf = self else { return }
                strongSelf.viewModel = BookListViewModel(books: books, user: user)
                strongSelf.reloadSectionZero(modifiededIndexes: indexes)
            }, modificationHandler: { [weak self] books, indexes in
                guard let strongSelf = self else { return }
                strongSelf.viewModel = BookListViewModel(books: books, user: user)
                strongSelf.reloadSectionZero(modifiededIndexes: indexes)
        })
    }
}

