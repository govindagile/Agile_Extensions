//
//  Extension_CGFloat.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

extension CGFloat{
	
	init?(_ str: String) {
		guard let float = Float(str) else { return nil }
		self = CGFloat(float)
	}

	
    /// Return two digit value
    ///
    /// - Returns: in String formate
	func twoDigitValue() -> String {
		
		let formatter = NumberFormatter()
		formatter.maximumFractionDigits = 2
		formatter.minimumFractionDigits = 0
		formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
		let str = formatter.string(from: NSNumber(value: Double(self)))
		return str! as String;
	}

    
    /// Calculate size depend on device Ex. GFloat(15.0).proportionalFontSize()
    ///
    /// - Returns: new value
	func proportionalFontSize() -> CGFloat {
		
        var sizeToCheckAgainst = self
        
        switch UIDevice.deviceType {
        case .iPhone4or4s:
            sizeToCheckAgainst -= 2
            break
        case .iPhone5or5s:
            sizeToCheckAgainst -= 1
            break
        case .iPhone6or6s:
            sizeToCheckAgainst -= 0
            break
        case .iPhone6por6sp:
            sizeToCheckAgainst += 1
            break
        case .iPhoneX:
            sizeToCheckAgainst += 0
            break
        case .iPad:
            sizeToCheckAgainst += 10
            break
        }
        return sizeToCheckAgainst
	}
    
   
    /// Return proportional Height Ex. CGFloat(0.0).proportionalHeight()
    ///
    /// - Returns: new value(CGFloat)
    func proportionalHeight() -> CGFloat {
        print("Devices.screenHeight: \(UIDevice.screenHeight)")
        print("curruntHeight: \(self)")
        
        if UIDevice.screenHeight == 812 || UIDevice.screenWidth == 812{
            return ((self*667)/667)
        }else{
            return (self*UIDevice.screenHeight)/667
        }
    }
    
    /// Return proportional width Ex. CGFloat(0.0).proportionalWidth()
    ///
    /// - Returns: new value(CGFloat)
    func proportionalWidth(_ curruntWidth:CGFloat) -> CGFloat {
        print("Devices.screenWidth: \(UIDevice.screenWidth)")
        print("curruntWidth: \(curruntWidth)")
        return (curruntWidth*UIDevice.screenWidth)/375
    }
    
    
}
