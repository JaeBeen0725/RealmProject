//
//  TableViewJeneric+Extention.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit

extension UITableViewCell {
    
    func cellLabel<T: UILabel>(view: T) {
        view.backgroundColor = .white
        view.textColor = .black
        view.adjustsFontSizeToFitWidth = true
        
    }
}
