//
//  BookWarmTableViewCell.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit

class BookWarmTableViewCell: UITableViewCell {
    
    let bookWarmtitle = UILabel()
    let bookWarmAuthor = UILabel()
    let bookWarmThumbNail = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bookWarmtitle)
        cellLabel(view: bookWarmtitle)
        contentView.addSubview(bookWarmAuthor)
        cellLabel(view: bookWarmAuthor)
        contentView.addSubview(bookWarmThumbNail)
        bookWarmThumbNail.backgroundColor = .cyan
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        bookWarmThumbNail.snp.makeConstraints { make in
            make.topMargin.leftMargin.bottomMargin.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(120)
        }
        
        bookWarmtitle.snp.makeConstraints { make in
            make.topMargin.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.leadingMargin.equalTo(bookWarmThumbNail.snp.trailing).offset(10)
            make.trailingMargin.equalTo(10)
            make.height.equalTo(40)
        }
        
        bookWarmAuthor.snp.makeConstraints { make in
            make.topMargin.equalTo(bookWarmtitle.snp.bottom).offset(16)
            make.leadingMargin.equalTo(bookWarmThumbNail.snp.trailing).offset(10)
            make.trailingMargin.equalTo(10)
            make.height.equalTo(40)
        }
        
        
        
    }
    
    
    
    
    
    
    
}
