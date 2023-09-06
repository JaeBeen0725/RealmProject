//
//  SetMemo.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/06.
//

import UIKit
import RealmSwift

/*
class SetMemoViewController: UIViewController {
    
    var data: BookWarmRealm?
    
//  let bookWarmTableView = BookWarmTableView()
    let realm = try! Realm()
    
    let memoTextView = UITextView()
   
    var tasks: Results<BookWarmRealm>!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
//        print("SetMemolView", #function)
        tasks = realm.objects(BookWarmRealm.self).sorted(byKeyPath: "memo", ascending: false)
        
        configure()
        setConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "설정", style: .plain, target: self, action: #selector(completeMemoButtonClicked))
    }
    

    @objc func completeMemoButtonClicked() {
        
        guard let data = data else {return}
        
        updateItem(id: data._id, title: data.title, author: data.author, thumbnail: data.thumbnail ?? "", memo: memoTextView.text)
        //bookWarmTableView.updateItem
//        tasks = BookWarmRealm(title: "", author: "", thumbnail: "", memo: memoTextView.text)
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateItem(id: ObjectId, title: String,author: String, thumbnail: String?, memo: String ) {
        
        do {
            try realm.write{
                realm.create(BookWarmRealm.self, value: ["_id": id, "title": title, "author": author, "thumbnail": thumbnail!, "memo": memo ], update: .modified)
            }
        } catch {
            print("")
        }
        
    }
    
    
    
    func configure() {
        view.addSubview(memoTextView)
        
    }
    
    func setConstraints(){
        
        memoTextView.backgroundColor = .brown
        memoTextView.snp.makeConstraints { make in
            make.size.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.5)
            make.center.equalTo(view.safeAreaLayoutGuide)
        
        }
        
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("SetMemolView", #function)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("SetMemolView", #function)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("SetMemolView", #function)
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("SetMemolView", #function)
//        
//    }
//    
    
}
*/
