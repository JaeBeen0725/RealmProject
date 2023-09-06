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
    @Persisted var title: String
    @Persisted var author: String
    @Persisted var thumbnail: String?
    
    convenience init(title: String, author: String, thumbnail: String?) {
        self.init()
        
        self.title = title
        self.author = author
        self.thumbnail = thumbnail
    }
}



