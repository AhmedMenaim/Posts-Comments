//
//  Posts.swift
//  Posts&Comments
//
//  Created by Crypto on 7/19/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

    
    
    struct Posts {
        let id: Int?
        let title: String?
    
    init(json: JSON) {
        id = json["id"].int
        title = json["title"].string
    }

}
