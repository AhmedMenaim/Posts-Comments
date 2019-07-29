//
//  File.swift
//  Posts&Comments
//
//  Created by Crypto on 7/19/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class UserServices {
    
    var myindex: Int = 1
    var postsviewmodel = postsViewModel()
    func getPosts (comlition: @escaping ([JSON]) -> Void){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let array = JSON(value).array {
                    comlition(array)
                }
                
            case .failure(let error):
                print (error)
            }
            print(response)
        }
    }
    
    func getComments (postId: Int, comlition: @escaping (JSON) -> Void){
        //        for myid in 1...100{
        //              myindex = postsviewmodel.posts[myid].id!
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(postId)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                
                comlition(JSON(value))
//                if let array = JSON(value) {
//                    comlition(array)
//                }
                
            case .failure(let error):
                print (error)
            }
            print(response)
        }
    }
//}
}
