//
//  SuperMailer.swift
//  ApologistToolKit
//
//  Created by CustomSoftware on 1/29/15.
//  Copyright (c) 2015 CustomSoftware. All rights reserved.
//

import UIKit
import MessageUI

open class SuperMailer: UIActivity, MFMailComposeViewControllerDelegate {
    
    var emailer : MFMailComposeViewController!
    open var caller : UIViewController!
    
    open class override var activityCategory : UIActivityCategory {
        return UIActivityCategory.share
    }
    
//    open override var activityType : String? {
//        return "superMailer.ToolKit.App"
//    }
    
    open override var activityTitle : String? {
        return "Super Mailer"
    }
    
//    public override func activityImage() -> UIImage? {
//        var bundle = NSBundle.mainBundle()
//        var bundlePath = "/Users/cs/Library/Developer/CoreSimulator/Devices/BD556DE8-6D18-4C10-8769-56F737F01DD5/data/Containers/Bundle/Application/4E1D2B8A-43EC-4C3D-BA90-A62DC0F39E2D/LDS Apologist.app"
//        var path = bundle.pathForResource("mail-icon", ofType: "png")
//        return UIImage(contentsOfFile: path!)
//    }
    
    open override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    open override func prepare(withActivityItems activityItems: [Any]) {
        // The array has: subject, body of email, addressee
        let items = activityItems as NSArray
        emailer = MFMailComposeViewController()
        emailer.mailComposeDelegate = self
        let recipient = items[2] as! String
        emailer.setToRecipients([recipient])
        emailer.setMessageBody(items[1] as! String, isHTML: false )
        emailer.setSubject(items[0] as! String)
    }
    
    open override func perform() {
        // This is where we send the email
        caller.present(emailer, animated: true, completion: nil )
    }
    
    open func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        
        if (result == MFMailComposeResult.sent ) {
            // Do good stuff here
        } else {
            // Handle as appropriate
        }
        
        caller.dismiss(animated: true , completion: nil )
    }
}
