//
//  SetMemo.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/06.
//

import UIKit
import RealmSwift


class SetMemoViewController: UIViewController {
    
   
    
    var data: BookWarmRealm?
    let realm = try! Realm()
    
    let memoTextView = UITextView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
//        print("SetMemolView", #function)
        
        configure()
        setConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "설정", style: .plain, target: self, action: #selector(completeMemoButtonClicked))
    }
    

    @objc func completeMemoButtonClicked() {
        
       
        //detailViewController.detailLabel
        
        navigationController?.popViewController(animated: true)
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
