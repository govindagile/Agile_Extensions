//
//  UIViewControllerExtension.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit

let tabBarTintColor             : UIColor = UIColor.red
let navigationBarTitleColor     : UIColor = UIColor.black
let navigationBarTintColor      : UIColor = UIColor.orange
let navigationBarbarTintColor   : UIColor = UIColor.red


extension UIViewController {
    
   
    // MARK:- NavigationController Functions
    // MARK:-
    
    
    /// Set Appearance of UINavigationBar.
    public func setAppearanceOfNavigationBar(){
        
        // Set navigationbar tittle,bar item , backgeound color
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = navigationBarTintColor
        self.navigationController?.navigationBar.barTintColor = navigationBarbarTintColor
        let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: navigationBarTitleColor,
                                       NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0) ]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [NSAttributedStringKey : AnyObject]
        
        
        // Set navigationbar back image(remove 'Back' from navagation)
        let backImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        // Set status bar
        // self.setStatusBar()
        
        // Set image in navigation title
        // let imageViewTitle = UIImageView(image:ImageNamed(name: "skilliTextLogo"))
        // imageViewTitle.contentMode = .scaleAspectFit
        // self.navigationItem.titleView = imageViewTitle
    }
    
    
    /// Set Translucent of UINavigationBar.
    public func setTranslucentOfNavigationBar(){
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    /// Hide bottom line from UINavigationBar.
    public func hideBottomLine() {
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    
    /// Default push mathord.
    ///
    /// - Parameter viewController: your viewcontroller(String)
    func pushTo(_ viewController:String) {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: viewController))!, animated: true)
    }
    
    
    /// Default pop mathord.
    func popTo() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /// Default pop to root controller.
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    /// Default present methord
    ///
    /// - Parameter viewController: your viewcontroller(String)
    func presentTo(_ viewController: String) {
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: viewController)
        let navController = UINavigationController(rootViewController: VC1!)
        self.present(navController, animated:true, completion: nil)
    }
    
    
    /// Default dismiss methord
    func dismissTo() {
        self.navigationController?.dismiss(animated: true, completion: {})
    }
    
    
    // MARK:- NavigationBar Functions
    // MARK:-
    
   
    /// Remove navigation bar item
    public func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    }
    
    
    /// Show or hide navigation bar
    ///
    /// - Parameter isShow: Bool(true, false)
    public func showNavigationBar(_ isShow : Bool) {
        self.navigationController?.isNavigationBarHidden = !isShow
    }
    
    // Right,left buttons
    
    /// Set left side Navigationbar button image.
    ///
    /// - Parameters:
    ///   - Name: set image name
    ///   - selector: return selector
    public func setLeftBarButtonImage(_ Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Name), style: .plain, target: self, action: selector)
        }
    }
   
    
    /// Set left side Navigationbar button title.
    ///
    /// - Parameters:
    ///   - Name: button name
    ///   - selector: return selector
    public func setLeftBarButtonTitle(_ Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title:Name, style: UIBarButtonItemStyle.plain, target: self, action: selector)
        }
    }
    
    
    /// Set right side Navigationbar button image.
    ///
    /// - Parameters:
    ///   - Name: set image name
    ///   - selector: return selector
    public func setRightBarButtonImage(_ Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Name), style: .plain, target: self, action: selector)
        }
    }
    
    
    /// Set right side Navigationbar button title.
    ///
    /// - Parameters:
    ///   - Name: button name
    ///   - selector: return selector
    public func setRightBarButtonTitle(_ Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title:Name,style: UIBarButtonItemStyle.plain,target: self, action: selector)
        }
    }
    
    
    
    /// Set right side two Navigationbar button image.
    ///
    /// - Parameters:
    ///   - btn1Name: First button image name
    ///   - selector1: Second button selector
    ///   - btn2Name: First button image name
    ///   - selector2: Second button selector
    public func setTwoRightBarButtonImage(_ btn1Name : String , selector1 : Selector, btn2Name : String , selector2 : Selector) {
        if (self.navigationController != nil) {
            let btn_1 : UIBarButtonItem =  UIBarButtonItem(image: UIImage(named: btn1Name), style: .plain, target: self, action: selector1)
            let btn_2 : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: btn2Name), style: .plain, target: self, action: selector2)
            let buttons : NSArray = [btn_1, btn_2]
            self.navigationItem.rightBarButtonItems = buttons as? [UIBarButtonItem]
        }
    }
    
    /*
    func setRightBarButtonTitle(_ Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            var barButton : UIBarButtonItem = UIBarButtonItem()
            barButton = UIBarButtonItem.init(title:Name.localized, style: UIBarButtonItemStyle.plain, target: self, action: selector)
            barButton.setTitleTextAttributes([ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18.0),
                                               NSAttributedStringKey.foregroundColor : UIColor.white,
                                               NSAttributedStringKey.backgroundColor:UIColor.white],
                                             for: UIControlState())
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
     */
    
    
    // MARK:- TabBar Functions
    // MARK:-
    
    
    /// Set TabBar visiblity
    ///
    /// - Parameter visible: Bool
    public func setTabBarVisible(visible:Bool) {
        
        if (tabBarIsVisible() == visible) { return }
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -60 : height)
        
        self.tabBarController?.tabBar.frame.offsetBy(dx:0, dy:offsetY!)
        self.tabBarController?.view.frame = CGRect(x:0,y:0,width: self.view.frame.width, height: self.view.frame.height + offsetY!)
        self.tabBarController?.view.setNeedsDisplay()
        self.tabBarController?.view.layoutIfNeeded()
    }
    
    /// Check TabBar visible or not
    ///
    /// - Returns: Bool(true, false)
    public func tabBarIsVisible() ->Bool {
        return self.tabBarController?.tabBar.frame.origin.y < UIScreen.main.bounds.height
    }
    
    
    /// Set AppearanceOfTabBar
    public func setAppearanceOfTabBar(){
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.tintColor = tabBarTintColor
    }
    
    
    /// Remove TabBar
    public func removeTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK:- UIViewController Functions
    // MARK:-
    
    
    /// Load your VieweContoller
    ///
    /// - Returns: self
    public class func loadController() -> Self {
        return instantiateViewControllerFromMainStoryBoard()
    }
    
    
    /// Set instantiat ViewController
    ///
    /// - Returns: self
    private class func instantiateViewControllerFromMainStoryBoard<T>() -> T{
        let controller  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    
    /// Set status bar background color
    ///
    /// - Parameter color: your color
    public func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    
    /// Set status bar style
    ///
    /// - Parameter style: statusbar style
    public func setStatusBar(style : UIStatusBarStyle = .lightContent){
        UIApplication.shared.statusBarStyle = style
    }
    
    
    /// Return Top Controller from window
    static var topMostController: UIViewController {
        if let topVC = UIViewController.topViewController() {
            return topVC
        }
        else if let window =  UIApplication.shared.delegate!.window, let rootVC = window?.rootViewController {
            return rootVC
        }
        return UIViewController()
    }
    
   
    fileprivate class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}


public extension UINavigationBar {
    
    /// Hide line under navigation bar
    public func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = true
    }
    
    ///  Show line under navigation bar
    public func showBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = false
    }
    
    fileprivate func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
            return (view as! UIImageView)
        }
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
                return imageView
            }
        }
        return nil
    }
    
}

public extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
    
    static public func setStatusBar(style : UIStatusBarStyle = .lightContent){
        self.shared.statusBarStyle = style
    }
    static public func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = self.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
}
