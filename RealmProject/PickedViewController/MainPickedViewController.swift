//
//  PickedViewController.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/06.
//

import UIKit
import RealmSwift
import Kingfisher

class MainPickedViewController: UIViewController {
    
    let realm = try! Realm()
    
    var tasks: Results<BookWarmRealm>!
    
    let pickedTableView = {
       let view = UITableView()
        view.rowHeight = 150
        view.register(PickedTableViewCell.self, forCellReuseIdentifier: "PickedTableViewCell")
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkScemaVersion()
        view.backgroundColor = .white
        print("efwaeaf", tasks ?? "")
        pickedTableView.dataSource = self
        pickedTableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: self, action: #selector(searchBarButtonClicked))
        tasks = fetch()
        configure()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        pickedTableView.reloadData()
        
    }
    
    
    func fetch() -> Results<BookWarmRealm> {
        
        let data = realm.objects(BookWarmRealm.self).sorted(byKeyPath: "booktitle", ascending: true)
        return data
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
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
    
    
//    func removeCellDocument() {
//        //guard let documentDi
//    }
//
    
    func checkScemaVersion() {
        
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("스키마 몇버전이니?: \(version)이요!")
        } catch {
            print(error)
        }
        
    }
    
}

extension MainPickedViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickedTableViewCell", for: indexPath) as? PickedTableViewCell else { return UITableViewCell() }
        let data = tasks[indexPath.row]
        let thumbnailURL = URL(string: data.thumbnail ?? "")
        
        cell.pickedbookWarmtitle.text = data.booktitle
        cell.pickedbookWarmAuthor.text = data.author
        cell.pickedbookWarmThumbNail.kf.setImage(with: thumbnailURL)
        cell.pickedbookWarmMemoLabel.text =  data.memo
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = tasks[indexPath.row]
        let vc = DetailViewController()
        vc._id = data._id
        vc.data = data
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let data = tasks[indexPath.row]
        let delete = UIContextualAction(style: .normal, title: "삭제") { action, view, completionHandler in
            
            try! self.realm.write{
                self.realm.delete(data)
            }
            self.pickedTableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
}
