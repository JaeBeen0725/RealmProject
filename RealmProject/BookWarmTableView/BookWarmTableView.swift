//
//  BookWarmTableView.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit
import SnapKit

class BookWarmTableView: UIViewController {
    
    let bookWarmApi = BookWarmAPIManager()
    
    var bookWarmList: BookWarm = BookWarm(documents: [], meta: nil)
    
    let bookWarmtableView = {
     let view =  UITableView()
        view.register(BookWarmTableViewCell.self, forCellReuseIdentifier: "BookWarmTableViewCell")
        view.rowHeight = 150
        return view
    }()
    
    let searchBar = UISearchBar()
    
    var page = 0
    
    var isEnd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.backgroundColor = .brown
        
        bookWarmtableView.dataSource = self
        bookWarmtableView.delegate = self
        bookWarmtableView.prefetchDataSource = self
        
        searchBar.delegate = self
      
        configure()
        setconstraints()
        
    }
    
    func configure() {
        view.addSubview(searchBar)
        view.addSubview(bookWarmtableView)
    }
    
    func setconstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        
        bookWarmtableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
 
    }
    
    func callBookWarmAPI(query: String, page: Int) {
        bookWarmApi.bookWarmAPI(query: query, page: page) { data in
            
            self.bookWarmList.documents.append(contentsOf: data.documents)
            
            guard let end = data.meta?.isEnd else { return }
            self.isEnd = end
            
            self.bookWarmtableView.reloadData()
            
        } failer: {
            print("error")
        }
    }
}


extension BookWarmTableView: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(bookWarmList.documents.count, "여기여기")
        return bookWarmList.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookWarmTableViewCell", for: indexPath) as? BookWarmTableViewCell else { return UITableViewCell() }
        let list = bookWarmList.documents[indexPath.item]
       
        cell.bookWarmtitle.text = list.title
        cell.bookWarmAuthor.text = list.authors.first
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
            for indexPath in indexPaths {
                if bookWarmList.documents.count - 1 == indexPath.row && !isEnd //&& page < 15
                {
                    page += 1
                    guard let text = searchBar.text else { return }
                    
                    callBookWarmAPI(query: text, page: page)
                }
            }
        }
    
}


extension BookWarmTableView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        self.bookWarmList.documents.removeAll()
    // bookWarmtableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        guard let text = searchBar.text else { return }
        
        callBookWarmAPI(query: text, page: page)
        

    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let text = searchBar.text else { return }
//        searchQuery(text: text)
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//    }
    
}
