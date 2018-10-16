//
//  APIConfigs.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

struct Address {
    
    static let baseUrl = "http://cqms-server/CQMSWebAPI/"
    
    struct Authen {
        static let login        =   "login"
    }
    
}

struct APICode {
    static let API_CODE_OK                            = "000"
    static let API_CODE_FAIL                          = "999"
    static let API_TOKEN_EXPIRE                       = "9999"
}
