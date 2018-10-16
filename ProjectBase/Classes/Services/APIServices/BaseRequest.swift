//
//  BaseRequest.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Alamofire
import RxSwift

class BaseRequest: URLRequestConvertible {
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    var parameters: [String: Any]? {
        return [String: Any]()
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = urlRequestWithHeaders()
        if method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        } else if method == .put {
            let urlEncoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
            urlRequest = try urlEncoding.encode(urlRequest, with: parameters)
            return urlRequest
        } else {
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        
        printURLPretty(urlRequest.url?.absoluteString)
        if let bodyData = urlRequest.httpBody {
            print("http request: \(String(data: urlRequest.httpBody!, encoding: .utf8)!)")
        }
        return urlRequest
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bear Token",
                "ClientApi": "Version Name"]
    }
    
    func urlRequestWithHeaders() -> URLRequest {
        let url = URL(string: Address.baseUrl)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30
        urlRequest.allHTTPHeaderFields = headers
        print("========= HEADERS: \(String(describing: urlRequest.allHTTPHeaderFields))")
        return urlRequest
    }
    
    func printURLPretty(_ urlStr: String?) {
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
        print("Parameters: \(String(describing: parameters))")
        print("URL: \(String(describing: urlStr))")
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    }
}
