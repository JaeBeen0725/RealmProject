//
//  BookWarmTableView.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit
import SnapKit
import RealmSwift
import Kingfisher

class BookWarmTableView: UIViewController {
    
    let bookWarmApi = BookWarmAPIManager()
    let bookWarmTableCell = BookWarmTableViewCell()
    var tasks: Results<BookWarmRealm>!
    
    let realm = try! Realm()
    
    var fullURL: String?
    
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

       tasks = realm.objects(BookWarmRealm.self).sorted(byKeyPath: "title", ascending: false)
        
        view.backgroundColor = .brown
        
        bookWarmtableView.dataSource = self
        bookWarmtableView.delegate = self
        bookWarmtableView.prefetchDataSource = self
        
        searchBar.delegate = self
      
        configure()
        setconstraints()
       
        
    }
    
    
    
//    func cellButtonTapped(book: Document) {
//
//        let realm = try! Realm()
//
//        let task = BookWarmRealm(title: book.title, author: book.authors.first ?? "흠", thumbnail: book.thumbnail)
//        try! realm.write{
//            realm.add(task)
//            print("작동 되나연")
//        }
//    }
    
    
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
        //print(bookWarmList.documents.count, "여기여기")
        return bookWarmList.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookWarmTableViewCell", for: indexPath) as? BookWarmTableViewCell else { return UITableViewCell() }
        let list = bookWarmList.documents[indexPath.item]
        
        let thumbnailURL = URL(string: list.thumbnail)
       
        cell.bookWarmtitle.text = list.title
        cell.bookWarmAuthor.text = list.authors.first
        cell.bookWarmThumbNail.kf.setImage(with: thumbnailURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
            for indexPath in indexPaths {
                if bookWarmList.documents.count - 1 == indexPath.row && !isEnd
                {
                    page += 1
                    guard let text = searchBar.text else { return }
                    
                    callBookWarmAPI(query: text, page: page)
                }
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookWarmList.documents[indexPath.item]
      //  let realm = try! Realm()
        let task = BookWarmRealm(title: book.title, author: book.authors.first ?? "흠", thumbnail: book.thumbnail)
        try! realm.write{
            realm.add(task)
            print("작동 되나연")
        }
        let vc = DetailViewController()
        vc._id = task._id
       let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true)
    }
    
}


extension BookWarmTableView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        self.bookWarmList.documents.removeAll()
   
        guard let text = searchBar.text else { return }
        
        callBookWarmAPI(query: text, page: page)
        

    }
    
    
}
