//
//  postsViewModel.swift
//  Posts&Comments
//
//  Created by Crypto on 7/19/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import Foundation
import SwiftyJSON
import  Alamofire

class postsViewModel {
    var posts = [Posts]()
    var comments = [Comments]()
    
    func getPosts(complition: @escaping () -> Void ){
        let userservices = UserServices()
        userservices.getPosts { [weak self] jsonarray in
            let postList = jsonarray.compactMap( {(json: JSON) -> Posts in
                return Posts(json: json)
                
            })
            self!.posts = postList
            complition()
        }
        
    }
    
    func getComments(postId: Int, complition: @escaping () -> Void ){
        let userservices = UserServices()
        userservices.getComments(postId: postId) { [weak self] jsonarray in
            
            let commentsList = Comments(json: jsonarray)
            
            
//            let commentsList = jsonarray.compactMap( {(json: JSON) -> Comments in
//                return Comments(json: json)
//            })
            self!.comments = [commentsList]
            complition()
        }
        
    }
    
}
