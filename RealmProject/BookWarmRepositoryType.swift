//
//  BookWarmRepositoryType.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/06.
//

//import Foundation
//import RealmSwift
//
//protocol BookWarmTableRepositoryType: AnyObject {
//    func fetch() -> Results<BookWarmRealm>
//    func fetchFilter() -> Results<BookWarmRealm>
//    func createItem(_ item: BookWarmRealm)
//}
//
//class BookWarmRepositoryType: BookWarmTableRepositoryType {
//    
//    let realm = try! Realm()
//    
//    func fetch() -> Results<BookWarmRealm> {
//        let data = realm.objects(BookWarmRealm.self).sorted(byKeyPath: "thumbnail", ascending: true)
//        return data
//    }
//    
//    func fetchFilter() -> Results<BookWarmRealm> {
//        <#code#>
//    }
//    
//    func createItem(_ item: BookWarmRealm) {
//        <#code#>
//    }
//    
//    
//   
//    
//    
//}
