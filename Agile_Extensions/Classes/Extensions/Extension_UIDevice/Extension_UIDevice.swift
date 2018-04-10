//
//  UIDeviceExtension.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    enum DeviceType:Int {
        case iPhone4or4s
        case iPhone5or5s
        case iPhone6or6s
        case iPhone6por6sp
        case iPhoneX
        case iPad
    }
    
    
    /// Check Decide type
    static var deviceType : DeviceType {
        // Need to match width also because if device is in portrait mode height will be different.
        if UIDevice.screenHeight == 480 || UIDevice.screenWidth == 480 {
            return DeviceType.iPhone4or4s
        } else if UIDevice.screenHeight == 568 || UIDevice.screenWidth == 568 {
            return DeviceType.iPhone5or5s
        } else if UIDevice.screenHeight == 667 || UIDevice.screenWidth == 667{
            return DeviceType.iPhone6or6s
        } else if UIDevice.screenHeight == 736 || UIDevice.screenWidth == 736{
            return DeviceType.iPhone6por6sp
        } else if UIDevice.screenHeight == 812 || UIDevice.screenWidth == 812{
            return DeviceType.iPhoneX
        } else {
            return DeviceType.iPad
        }
    }
    
    
    /// Check device is Portrait mode
    static var isPortrait : Bool {
        return UIDevice.current.orientation.isPortrait
    }
    
    /// Check device is Landscape mode
    static var isLandscape : Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    // MARK: - Device Screen Height
    
    /// Return screen height
    static var screenHeight : CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    // MARK: - Device Screen Width
    
    /// Return screen width
    static var screenWidth : CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /// Return screen size
    static var screenSize : CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// Return device model name
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    
    // MARK: - Device is iPad
    
    /// Return is iPad device
    static var isIpad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    // MARK: - Device is iPhone
    
    /// Return is iPhone device
    static var isIphone : Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
   
}
