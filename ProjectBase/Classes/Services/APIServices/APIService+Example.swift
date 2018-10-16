//
//  APIService+Example.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Alamofire
import RxSwift
import RxAlamofire

class ExampleRouter: BaseRequest {
    enum EndPoint {
        case example([String: Any])
    }
    
    var endPoint: EndPoint
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    override var method: HTTPMethod {
        switch endPoint {
        case .example:
            return .post
        }
    }
    
    override var parameters: [String : Any]? {
        switch endPoint {
        case .example(let param):
            return param
        }
    }
    
    override var path: String {
        switch endPoint {
        case .example:
            return Address.Authen.login
        }
    }
}

extension APIService {
    
    static func example(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(ExampleRouter(endPoint: .example(param)))
    }
    
}
