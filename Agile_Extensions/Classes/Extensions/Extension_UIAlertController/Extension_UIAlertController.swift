//
//  UIAlertControllerExtension.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    
    /// Show AlertController with message only
    ///
    /// - Parameters:
    ///   - message: set your message
    ///   - buttonTitles: set button array
    ///   - buttonAction: return button click block
    static func showAlert(withMessage message: String,
                          buttonTitles: [String] = ["okay"],
                          buttonAction:((_ index:Int) -> Void)!) -> Void{
        
        
        self.showAlert(withTitle:  Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String,
                       withMessage: message,
                       buttonTitles: buttonTitles,
                       buttonAction: buttonAction)

    }
    
    
    /// Show AlertController with message and title
    ///
    /// - Parameters:
    ///   - title: set your title
    ///   - message: set your message
    ///   - buttonTitles: set button array
    ///   - buttonAction: return button click block
    static func showAlert(withTitle title: String,
                          withMessage message: String,
                          buttonTitles: [String],
                          buttonAction:((_ index:Int) -> Void)!) -> Void{
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for btn in buttonTitles {
            alertController.addAction(UIAlertAction(title: btn, style: .default, handler: { (action) in
                if let validHandler = buttonAction {
                    validHandler(buttonTitles.index(of: btn)!)
                }
            }))
        }
      // (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.present(alertController, animated: true, completion: nil)
      UIApplication.shared.delegate!.window!?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    /// Show Actionsheet with message only
    ///
    /// - Parameters:
    ///   - vc: where you display (UIViewController)
    ///   - message: your message
    ///   - buttons: button array
    ///   - canCancel: with cancel button
    ///   - completion: completion handler
    static func showActionSheetFromVC(vc:UIViewController,
                                      andMessage message:String,
                                      buttons:[String],
                                      canCancel:Bool,
                                      completion:((_ index:Int) -> Void)!) -> Void {
        
        
        self.showActionSheetWithTitleFromVC(vc: vc,
                                            title: Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String,
                                            andMessage: message,
                                            buttons: buttons,
                                            canCancel: canCancel,
                                            completion: completion)
        
        
        
    }
    
    
    
    /// Show Actionsheet with message and title
    ///
    /// - Parameters:
    ///   - vc: where you display (UIViewController)
    ///   - title: Alert title
    ///   - message: your message
    ///   - buttons: button array
    ///   - canCancel: with cancel button
    ///   - completion: completion handler
    static func showActionSheetWithTitleFromVC(vc:UIViewController,
                                               title:String,
                                               andMessage message:String,
                                               buttons:[String],
                                               canCancel:Bool,
                                               completion:((_ index:Int) -> Void)!) -> Void {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for index in 0..<buttons.count    {
            
            let action = UIAlertAction(title: buttons[index], style: .default, handler: {
                (alert: UIAlertAction!) in
                if(completion != nil){
                    completion(index)
                }
            })
            
            alertController.addAction(action)
        }
        
        if(canCancel){
            let action = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) in
                if(completion != nil){
                    completion(buttons.count)
                }
            })
            
            alertController.addAction(action)
        }
        
        if(UIDevice.isIpad){
            
            if(vc.view != nil){
                alertController.popoverPresentationController?.sourceView = vc.view
                alertController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: (vc.view?.frame.size.height)!, width: 1.0, height: 1.0)
            }else{
                alertController.popoverPresentationController?.sourceView = UIApplication.shared.delegate!.window!?.rootViewController!.view
                alertController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
            }
        }
        UIApplication.shared.delegate!.window!?.rootViewController!.present(alertController, animated: true, completion:nil)
       
    }
    
   
    
    
}

