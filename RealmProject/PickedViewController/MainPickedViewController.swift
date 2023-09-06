//
//  PickedViewController.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/06.
//

import UIKit
import RealmSwift

class MainPickedViewController: UIViewController {
    
    let realm = try! Realm()
    
    let pickedTableView = {
       let view = UITableView()
        view.rowHeight = 150
        view.register(PickedTableViewCell.self, forCellReuseIdentifier: "PickedTableViewCell")
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        pickedTableView.dataSource = self
        pickedTableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: self, action: #selector(searchBarButtonClicked))
        
        configure()
        setConstraints()
    }
    
    func configure() {
        view.addSubview(pickedTableView)
    }
    
    func setConstraints() {
        
        pickedTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    
    @objc func searchBarButtonClicked() {
         
        let vc =  BookWarmTableView()
        
        
        present(vc, animated: true)
    }
    
    
}

extension MainPickedViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickedTableViewCell", for: indexPath) as? PickedTableViewCell else { return UITableViewCell() }
        
        cell.pickedbookWarmMemoLabel.text =  "erwer32"
        
        
        return cell
    }
    

}
