//
//  Extension_UILabel.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//


import Foundation
import UIKit

public extension UILabel {
	
    /// Set line height
    ///
    /// - Parameter lineHeight: set your line height
	public func setLineHeight(lineHeight: CGFloat) {
		self.setLineHeight(lineHeight: lineHeight, withAlignment: .left)
	}
	
    /// Set line height of label
    ///
    /// - Parameters:
    ///   - lineHeight: set your line height
    ///   - alignment: text alignment
	public func setLineHeight(lineHeight: CGFloat, withAlignment alignment:NSTextAlignment) {
		let text = self.text
		if let text = text {
			
            let attributeString = NSMutableAttributedString(string: text)
			let style = NSMutableParagraphStyle()
			style.lineSpacing = lineHeight
			style.alignment = alignment
			attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
			self.attributedText = attributeString
		}
	}
}

public extension UILabel {
	
	
    /// Add image in label
    ///
    /// - Parameters:
    ///   - name: add image name
    ///   - behindText: image behind text or not
	public func addImageWith(name: String, behindText: Bool = false) {
		
		let attachment = NSTextAttachment()
		attachment.image = UIImage(named: name)
		let attachmentString = NSAttributedString(attachment: attachment)
		
		guard let txt = self.text else {
			return
		}
		
        if behindText {
			let strLabelText = NSMutableAttributedString(string: txt)
			strLabelText.append(attachmentString)
			self.attributedText = strLabelText
		} else {
			let strLabelText = NSAttributedString(string: txt)
			let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
			mutableAttachmentString.append(strLabelText)
			self.attributedText = mutableAttachmentString
		}
		
	}
	
    /// Remove image from label
	public func removeImage() {
		
		let text = self.text
		self.attributedText = nil
		self.text = text
	}
}
