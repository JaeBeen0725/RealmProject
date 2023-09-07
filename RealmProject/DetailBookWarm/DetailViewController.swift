//
//  ViewController.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit
import RealmSwift
import Kingfisher

class DetailViewController: UIViewController{

    let detailThumbnail = UIImageView()
    let detailTextField = UITextField()
    let realm = try! Realm()
    var _id: ObjectId?
    var data: BookWarmRealm?
    
    var tasks: Results<BookWarmRealm>!
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("detailView", #function)
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(setmemoButtonClicked))
     
        configure()
        setConstraints()
        showDetailThumbnail()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //memo()
    }
    
//    func memo() {
//        tasks = realm.objects(BookWarmRealm.self).where({ bookMemo in
//            bookMemo._id == _id!
//        })
//        detailLabel.text = "\(tasks.first?.memo ?? "")"
//        print(detailLabel.text!)
//
//    }
    
    func showDetailThumbnail() {
        
        tasks = realm.objects(BookWarmRealm.self).where({ bookwarm in
            bookwarm._id == _id!
        })
        let url = URL(string: tasks.first!.thumbnail ?? "")
        detailThumbnail.kf.setImage(with: url)

    }
    
    @objc func setmemoButtonClicked() {
        
        guard let data = data else {return}
      updateItem(id: data._id, title: data.booktitle, author: data.author, thumbnail: data.thumbnail ?? "", memo: detailTextField.text ?? "")
        
     dismiss(animated: true)
        
        
        
    }

    func configure() {
        view.addSubview(detailThumbnail)
        view.addSubview(detailTextField)
        
    }
    
    func setConstraints() {
        
        detailThumbnail.backgroundColor = .black
        detailThumbnail.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(250)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        detailTextField.backgroundColor = .brown
        detailTextField.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(40)
        }
            
        }
    func updateItem(id: ObjectId, title: String, author: String, thumbnail: String, memo: String) {
        
        do {
            try realm.write {
                realm.create(BookWarmRealm.self, value: ["_id": id, "booktitle": title, "author": author, "thumbnail": thumbnail, "memo": memo ], update: .modified)
            }
        } catch {
            print("")
        }
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("detailView", #function)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("detailView", #function)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("detailView", #function)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("detailView", #function)
//
//    }
    
    
}

