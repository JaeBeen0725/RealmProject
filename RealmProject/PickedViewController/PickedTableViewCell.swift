//
//  PickedTableViewCell.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/07.
//

import UIKit

class PickedTableViewCell: UITableViewCell {
    
    
    let pickedbookWarmtitle = UILabel()
    let pickedbookWarmAuthor = UILabel()
    let pickedbookWarmThumbNail = UIImageView()
    let pickedbookWarmMemoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        pickedbookWarmThumbNail.backgroundColor = .cyan
        configure()
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        contentView.addSubview(pickedbookWarmtitle)
        cellLabel(view: pickedbookWarmtitle)
        contentView.addSubview(pickedbookWarmAuthor)
        cellLabel(view: pickedbookWarmAuthor)
        contentView.addSubview(pickedbookWarmThumbNail)
        contentView.addSubview(pickedbookWarmMemoLabel)
        cellLabel(view: pickedbookWarmMemoLabel)
  
    }
    
    func setConstraint() {
        pickedbookWarmThumbNail.snp.makeConstraints { make in
            make.topMargin.leftMargin.bottomMargin.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(120)
        }
        
        pickedbookWarmtitle.snp.makeConstraints { make in
            make.topMargin.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.leadingMargin.equalTo(pickedbookWarmThumbNail.snp.trailing).offset(10)
            make.trailingMargin.equalTo(10)
            make.height.equalTo(40)
        }
        
        pickedbookWarmAuthor.snp.makeConstraints { make in
            make.topMargin.equalTo(pickedbookWarmtitle.snp.bottom).offset(16)
            make.leadingMargin.equalTo(pickedbookWarmThumbNail.snp.trailing).offset(10)
            make.trailingMargin.equalTo(10)
            make.height.equalTo(40)
        }
        
        pickedbookWarmMemoLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(pickedbookWarmAuthor.snp.bottom).offset(16)
            make.leadingMargin.equalTo(pickedbookWarmThumbNail.snp.trailing).offset(10)
            make.trailingMargin.equalTo(10)
            make.height.equalTo(40)
        }
        
        
    }
    
}
