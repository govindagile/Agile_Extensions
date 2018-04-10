//
//  UIStoryboardExtension.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    
    /// Set Storyboard
    ///
    /// - Returns: UIStoryboard
    public class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
