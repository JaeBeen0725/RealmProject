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
    let detailLabel = UILabel()
    let realm = try! Realm()
    var _id: ObjectId?
    
    
    var tasks: Results<BookWarmRealm>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("detailView", #function)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "메모", style: .plain, target: self, action: #selector(setmemoButtonClicked))
        
        configure()
        setConstraints()
        
        tasks = realm.objects(BookWarmRealm.self).where({ bookwarm in
            bookwarm._id == _id!
        })
        print(tasks!)
        showDetailThumbnail()
        let url = URL(string: tasks.first!.thumbnail ?? "")
        detailThumbnail.kf.setImage(with: url)
       
    }
    
    func showDetailThumbnail() {
        
//        let url = URL()
//
//        detailThumbnail
    }
    
    @objc func setmemoButtonClicked() {
        let vc = SetMemoViewController()
        
       
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

    func configure() {
        view.addSubview(detailThumbnail)
        view.addSubview(detailLabel)
        
    }
    
    func setConstraints() {
        
        detailThumbnail.backgroundColor = .black
        detailThumbnail.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(250)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        detailLabel.backgroundColor = .brown
        detailLabel.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(40)
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

