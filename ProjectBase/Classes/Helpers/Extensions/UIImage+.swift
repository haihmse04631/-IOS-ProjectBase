//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

extension UIImage {

    func rotate(by degrees: CGFloat) -> UIImage {
        let rotatedViewBox = UIView(frame: CGRect(origin: .zero, size: size))
        rotatedViewBox.transform = CGAffineTransform(rotationAngle: degrees) 
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()!
        //Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        //Rotate the image context
        bitmap.rotate(by: degrees)
        //Now, draw the rotated/scaled image into the context
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(self.cgImage!, in: CGRect(origin: CGPoint(x: -size.width / 2, y: -size.height / 2), size: size))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
