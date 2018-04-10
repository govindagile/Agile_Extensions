//
//  UISegmentControl.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import Foundation
import UIKit

public extension UISegmentedControl {
    
    /// Remove border
    public func removeBorders() {
        setBackgroundImage(imageWithColor(UIColor.white), for: UIControlState(), barMetrics: .default)
        setBackgroundImage(imageWithColor(UIColor.gray), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(UIColor.clear), forLeftSegmentState: UIControlState(), rightSegmentState: UIControlState(), barMetrics: .default)
    }
    
    /// Segment with multipal line
    public func MultiLine() {
        for segment in subviews
        {
            for subview in segment.subviews
            {
                if let segmentLabel = subview as? UILabel
                {
                    segmentLabel.numberOfLines = 0
                }
            }
        }
    }
    
    /// create a 1x1 image with color
    ///
    /// - Parameter color: pass your color
    /// - Returns: return your image
    fileprivate func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
    
    /// Font of titles
    public func title(font: UIFont) {
        let attributes: [NSAttributedStringKey: Any] = [.font: font]
        setTitleTextAttributes(attributes, for: UIControlState())
        //setNeedsDisplay()
        //layoutIfNeeded()
    }
    
    /// Segments titles.
    public var segmentTitles: [String?] {
        get {
            var titles: [String?] = []
            var i = 0
            while i < numberOfSegments {
                titles.append(titleForSegment(at: i))
                i += 1
            }
            return titles
        }
        set {
            removeAllSegments()
            for (index, title) in newValue.enumerated() {
                insertSegment(withTitle: title, at: index, animated: false)
            }
        }
    }
    
    /// Segments images.
    public var segmentImages: [UIImage?] {
        get {
            var images: [UIImage?] = []
            var i = 0
            while i < numberOfSegments {
                images.append(imageForSegment(at: i))
                i += 1
            }
            return images
        }
        set {
            removeAllSegments()
            for (index, image) in newValue.enumerated() {
                insertSegment(with: image, at: index, animated: false)
            }
        }
    }
    
}
