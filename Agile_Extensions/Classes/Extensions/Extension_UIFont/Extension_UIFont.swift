//
//  Extension_UIFont.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//


import Foundation
import UIKit

extension UIFont {
	
	// OPENSANS REGULAR
	class func appFont_Regular(fontSize : CGFloat) -> UIFont {
		return UIFont(name: "CenturyGothic", size: fontSize)!
	}

	// OPENSANS BOLD
	class func appFont_Bold(fontSize : CGFloat) -> UIFont {
		return UIFont(name: "CenturyGothic-Bold", size: fontSize)!
	}
}
