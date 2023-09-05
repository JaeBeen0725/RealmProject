//
//  BookWarmAPIManager.swift
//  RealmProject
//
//  Created by Jae Oh on 2023/09/05.
//

import UIKit
import SwiftyJSON
import Alamofire

class BookWarmAPIManager: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func bookWarmAPI(query: String, page: Int, success: @escaping (BookWarm) -> Void, failer: @escaping () -> Void ) {
        
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)&size=10&page=\(page)"
        let header: HTTPHeaders = ["Authorization": APIKey.KakaoKey]
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: BookWarm.self) { response in
            
            switch response.result {
            case .success(let value): success(value)
            
            case .failure(let error):
                print(error)
                failer()
            }

        }
        
    }
    
    
}
