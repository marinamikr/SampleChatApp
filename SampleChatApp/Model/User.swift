//
//  User.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import Foundation
class User: NSObject {
    @objc dynamic var userName: String!
    @objc dynamic var iconImage: NSData!
    @objc dynamic var contents: String!
    
    init(text:String,userName:String,icon:NSData) {
        self.iconImage = icon
        self.userName = userName
        self.contents = text
    }
}
