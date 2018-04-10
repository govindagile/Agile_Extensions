//
//  Extension_UIView.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import Foundation
import UIKit


//MARK:- AIEdge
public enum AIEdge:Int {
	case
	Top,
	Left,
	Bottom,
	Right,
	Top_Left,
	Top_Right,
	Bottom_Left,
	Bottom_Right,
	All,
	None
}

// MARK: - Properties

public extension UIView {
    
    /// Size of view.
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    /// Width of view.
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    /// xPos of view.
    public var xPos: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    /// yPos of view.
    public var yPos: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
}

@IBDesignable
extension UIView {
    
    @IBInspectable
    /// Should the corner be as circle
    public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
        }
    }
    
    @IBInspectable
    /// Border color of view; also inspectable from Storyboard.
    public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    /// Border width of view; also inspectable from Storyboard.
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    /// Shadow color of view; also inspectable from Storyboard.
    public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    /// Shadow offset of view; also inspectable from Storyboard.
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    /// Shadow opacity of view; also inspectable from Storyboard.
    public var shadowOpacity: Double {
        get {
            return Double(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    /// Shadow path of view; also inspectable from Storyboard.
    public var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowShouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowRasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = newValue
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}

extension UIView {
    
    /// This is the function to get subview of current view
    public func searchVisualEffectsSubview() -> UIVisualEffectView? {
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        } else {
            for subview in subviews {
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        return nil
    }
    
    
    /// This is the function to get superview of current view
    ///
    /// - Parameter type: UIView
    /// - Returns: UIView
    public func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: T.self) }
    }
    
    /// This is the function to get subViews of a view of a particular type
    // https://stackoverflow.com/a/45297466/5321670
    public func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    // https://stackoverflow.com/a/45297466/5321670
    public func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}

// MARK: - Methods

public extension UIView {
    
    public typealias Configuration = (UIView) -> Swift.Void
    
    public func config(configurate: Configuration?) {
        configurate?(self)
    }
    
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

public extension UIView {
	
    
    /// Set Blur view over your view
    ///
    /// - Parameters:
    ///   - style: set your style like .dark , .light
    ///   - alpha: set blur alpha
    func setBlurImage(style : UIBlurEffectStyle = .light , alpha : CGFloat = 1.0)  {
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.alpha = alpha
            //always fill the view
            blurEffectView.frame =  self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(blurEffectView)
        }
    }
	
    /// Custom dashed border
    ///
    /// - Parameters:
    ///   - radius: border radius
    ///   - color: border color
    public func applyDashedBorder(radius: CGFloat = 0, color : UIColor = UIColor.black) {
        DispatchQueue.main.async {
            
            let cornerRadius: CGFloat = radius
            
            //creating a path
            let path: CGMutablePath = CGMutablePath()
            
            //drawing a border around a view
            path.move(to: CGPoint(x: CGFloat(0), y: CGFloat(self.frame.size.height - cornerRadius)), transform: .identity)
            path.addLine(to: CGPoint(x: CGFloat(0), y: CGFloat(cornerRadius)), transform: .identity)
            path.addArc(center: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(Double.pi), endAngle: CGFloat(-Double.pi/2), clockwise: false, transform: .identity)
            path.addLine(to: CGPoint(x: CGFloat(self.frame.size.width - cornerRadius), y: CGFloat(0)), transform: .identity)
            path.addArc(center: CGPoint(x: CGFloat(self.frame.size.width - cornerRadius), y: CGFloat(cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(0), clockwise: false, transform: .identity)
            path.addLine(to: CGPoint(x: CGFloat(self.frame.size.width), y: CGFloat(self.frame.size.height - cornerRadius)), transform: .identity)
            path.addArc(center: CGPoint(x: CGFloat(self.frame.size.width - cornerRadius), y: CGFloat(self.frame.size.height - cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi/2), clockwise: false, transform: .identity)
            path.addLine(to: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(self.frame.size.height)), transform: .identity)
            path.addArc(center: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(self.frame.size.height - cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: false, transform: .identity)
            
            //path is set as the _shapeLayer object's path
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2,2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = path
            self.layer.addSublayer(yourViewBorder)
        }
    }
	
	
    
    /// Rotate your view
    ///
    /// - Parameter angle: give angle
	public func rotate(angle: CGFloat) {
		let radians = angle / 180.0 * CGFloat(Double.pi)
		self.transform = self.transform.rotated(by: radians);
	}
	
	
	
    
    /// Custom Border to view
    ///
    /// - Parameters:
    ///   - color: border color
    ///   - width: border width
	public func applyBorder(color:UIColor, width:CGFloat) {
		DispatchQueue.main.async {
            self.layer.borderWidth = width
            self.layer.borderColor = color.cgColor
		}
	}
    
    /// Custom border with spacific edge
    ///
    /// - Parameters:
    ///   - color: border color
    ///   - edge: border edge
    ///   - thicknessOfBorder: border width
    public func addBorderWithColor(color:UIColor, edge:AIEdge, thicknessOfBorder:CGFloat)    {
        
        
        DispatchQueue.main.async {
            
            var rect:CGRect = CGRect.zero
            
            switch edge {
            case .Top:
                rect = CGRect(x: 0, y: 0, width: self.width, height: thicknessOfBorder)
            case .Left:
                rect = CGRect(x: 0, y: 0, width: thicknessOfBorder, height:self.width )
            case .Bottom:
                rect = CGRect(x: 0, y: self.height - thicknessOfBorder, width: self.width, height: thicknessOfBorder)
            case .Right:
                rect = CGRect(x: self.width-thicknessOfBorder, y: 0, width: thicknessOfBorder, height: self.height)
            default:
                break
            }
            
            let layerBorder = CALayer()
            layerBorder.frame = rect
            layerBorder.backgroundColor = color.cgColor
            self.layer.addSublayer(layerBorder)
        }
    }
	

    /// Custom shadow to view
    ///
    /// - Parameters:
    ///   - color: set shadow color
    ///   - opacity: set shadow opacity
    ///   - radius: set shadow radius
    ///   - edge: set shadow Edge
    ///   - shadowSpace: set shadowSpace
	public func applyShadowWithColor(color:UIColor, opacity:Float, radius: CGFloat, edge:AIEdge, shadowSpace:CGFloat)	{
		
		var sizeOffset:CGSize = CGSize.zero
		switch edge {
		case .Top:
			sizeOffset = CGSize(width: 0, height: -shadowSpace)
		case .Left:
			sizeOffset = CGSize(width: -shadowSpace, height: 0)
		case .Bottom:
			sizeOffset = CGSize(width: 0, height: shadowSpace)
		case .Right:
			sizeOffset = CGSize(width: shadowSpace, height: 0)
			
			
		case .Top_Left:
			sizeOffset = CGSize(width: -shadowSpace, height: -shadowSpace)
		case .Top_Right:
			sizeOffset = CGSize(width: shadowSpace, height: -shadowSpace)
		case .Bottom_Left:
			sizeOffset = CGSize(width: -shadowSpace, height: shadowSpace)
		case .Bottom_Right:
			sizeOffset = CGSize(width: shadowSpace, height: shadowSpace)
			
			
		case .All:
			sizeOffset = CGSize(width: 0, height: 0)
		case .None:
			sizeOffset = CGSize.zero
		}
		
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOpacity = opacity
		self.layer.shadowOffset = sizeOffset
		self.layer.shadowRadius = radius
		self.layer.masksToBounds = false
	}
	
	
	
	
	
    /// Shake your view
    ///
    /// - Parameter duration: set time for shaking
    public func shakeView(duration : Float = 0.5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration =  CFTimeInterval(duration) //0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    

}
