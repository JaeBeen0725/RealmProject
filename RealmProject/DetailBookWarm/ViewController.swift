//
//  ViewController.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit

class DetailViewController: UIViewController{

    let detailThumbnail = UIImageView()
    let detailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        setConstraints()
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
    
    
}

