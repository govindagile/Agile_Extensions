//
//  Extension_String.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit


public extension String {
    
    
    /// Return character
    ///
    /// - Parameter i: offsetBy
    public subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    /// Return string
    ///
    /// - Parameter i: offsetBy
    public subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    
    /// Return string from range
    ///
    /// - Parameter r: set your range
    public subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }
    
}


public extension String {
	
    /// Retuen bool value.
    public var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    /// Return Integer value.
    public var intValue: Int {
        return (self as NSString).integerValue
    }
    
    /// Return string length.
    public var length: Int {
        return self.count
    }
    
    /// Checks if all the characters inside the string are alphabets or not
    public var containsAlphabets: Bool {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        }
    }
    
    /// Return class name.
    public func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    
    /// Check last charcter is white space.
	public func isLastCharcterWhiteSpace() -> Bool{
		
		if(self.count == 0){
			return false
		}
		var result:Bool = false
		if(self.count == 1){
			result = self[0] == " "
		}else{
			result = self[self.count-1] == " "
		}
		return result
	}
	
    /// Adjacent whitespace.
	public func containsAdjacentSpaces() -> Bool{
		
		if(self.count == 0){
			return false
		}
		
		var result = false
		if(self.count == 1){
			result = false
		}else{
			var wasLastCharacterAWhiteSpace = false
			for i in 0..<self.count{
				let currentChar = self[i] as Character
				print(currentChar)
				if(currentChar == " "){
					if(wasLastCharacterAWhiteSpace){
						return true
					}
					wasLastCharacterAWhiteSpace = true
				}else{
					wasLastCharacterAWhiteSpace = false
				}
			}
		}
		return result
	}
	
    /// Trimmmed whitespace from string.
	public func whiteSpaceTrimmed() -> String{
		return self.components(separatedBy: NSCharacterSet.whitespaces).filter({ !$0.isEmpty }).joined(separator: " ")
	}
	
	/// Return string height.
	public func heightWithWidthAndFont(width: CGFloat, font: UIFont) -> CGFloat {
		
		let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
		return boundingBox.height
	}
	
    /// Check is valid email or not.
	public func isValidEmail() -> Bool	{
		return ( (isValidEmail_OLD(stringToCheckForEmail: self as String))  && (isValidEmail_NEW(stringToCheckForEmail: self as String)) )
	}
	
    /// Check is valid email or not(old methord).
	public func isValidEmail_OLD(stringToCheckForEmail:String) -> Bool {
		let emailRegex = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Z0-9a-z]+([.-]{1}[A-Z0-9a-z]+)*(\\.[A-Za-z]{2,4}){0,1}"
		return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: stringToCheckForEmail)
	}
	
    /// Check is valid email or not(New methord).
	public func isValidEmail_NEW(stringToCheckForEmail:String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: stringToCheckForEmail)
	}
    
	/// Check in string contains emoji or not
	public var containsEmoji: Bool {
		get {
			for scalar in unicodeScalars {
				switch scalar.value {
				case 0x1F600...0x1F64F, // Emoticons
				0x1F300...0x1F5FF, // Misc Symbols and Pictographs
				0x1F680...0x1F6FF, // Transport and Map
				0x2600...0x26FF,   // Misc symbols
				0x2700...0x27BF,   // Dingbats
				0xFE00...0xFE0F:   // Variation Selectors
					return true
				default:
					continue
				}
			}
			return false
		}
	}
	
    /// Return localize string from key
    public static func localize(_ key: String, comment: String) -> String {
        return NSLocalizedString(key, comment: comment)
    }
    
    /// Return string in loacalized string
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /// Convert First characters in captital
    public func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    
    /// Convert NSDictionary to string(JSONSerialization)
    ///
    /// - Parameter dict: dict Parameter
    /// - Returns: return your value in string
    public func getStringFromDictionary(dict:Any) -> String{
        var strJson = ""
        do {
            let data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            strJson = String(data: data, encoding: String.Encoding.utf8)!
        } catch let error as NSError {
            print("json error: \(error.localizedDescription)")
        }
        
        return strJson
    }
    
}

// MARK: - NSAttributedString extensions
public extension String {
    
    /// Regular string.
    public var regular: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Bold string.
    public var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Underlined string
    public var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
    }
    
    /// Strikethrough string.
    public var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)])
    }
    
    /// Italic string.
    public var italic: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    public func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
}

