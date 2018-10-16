//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import SwiftyUserDefaults

enum ShowScreen: Int {
    case screen16 = 0
    case screen24 = 1
    case screen25 = 2
    case none = 3
}

extension DefaultsKeys {
    static let username = DefaultsKey<String>("username")
    static let userToken = DefaultsKey<String>("userToken")
}
