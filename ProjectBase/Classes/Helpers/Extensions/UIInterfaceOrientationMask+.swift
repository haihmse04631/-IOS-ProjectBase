//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

extension UIInterfaceOrientationMask {
    
    init(orientation: UIDeviceOrientation) {
        switch orientation {
        case .landscapeRight:       self = .landscapeRight
        case .landscapeLeft:        self = .landscapeLeft
        case .portrait:             self = .portrait
        case .portraitUpsideDown:   self = .portraitUpsideDown
        default:                    self = .portrait
        }
    }
    
    static var currentOrientation: UIInterfaceOrientationMask {
        switch UIDevice.current.orientation {
        case .landscapeRight:       return .landscapeRight
        case .landscapeLeft:        return .landscapeLeft
        case .portrait:             return .portrait
        case .portraitUpsideDown:   return .portraitUpsideDown
        default:                    return .portrait
        }
    }
}
