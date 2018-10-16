//
//  APIService.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import RxSwift
import Alamofire
import RxAlamofire

struct APIService {
    
    static func request(_ urlRequest: BaseRequest) -> Observable<APIResponse> {
        return Observable.create({ observer in
            _ = RxAlamofire.request(urlRequest).responseJSON().subscribe(onNext: { response in
                observer.onNext(APIResponse(response))
                observer.onCompleted()
            }, onError: { error in
                _ = APIResponse(error)
                observer.onError(error)
            })
            return Disposables.create()
        })
    }
}

