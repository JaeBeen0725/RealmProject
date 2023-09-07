//
//  BookWarmRealm.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import Foundation
import RealmSwift

class BookWarmRealm : Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var booktitle: String
    @Persisted var author: String
    @Persisted var thumbnail: String?
    @Persisted var memo: String
    
    convenience init(booktitle: String, author: String, thumbnail: String?, memo: String) {
        self.init()
        
        self.booktitle = booktitle
        self.author = author
        self.thumbnail = thumbnail
        self.memo = memo
    }
}


