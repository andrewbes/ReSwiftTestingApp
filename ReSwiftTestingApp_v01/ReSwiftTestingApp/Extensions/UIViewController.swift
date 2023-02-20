//
//  UIViewController.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/16/23.
//

import UIKit

extension UIViewController {
    
    class var identifier: String {
        let separator = "."
        let fullName = String(describing: self)
        if fullName.contains(separator) {
            let items = fullName.components(separatedBy: separator)
            if let name = items.last {
                return name
            }
        }
        
        return fullName
    }
    
}
