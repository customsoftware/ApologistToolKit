//
//  SuperMailer.swift
//  ApologistToolKit
//
//  Created by CustomSoftware on 1/29/15.
//  Copyright (c) 2015 CustomSoftware. All rights reserved.
//

import UIKit
import MessageUI

public class SuperMailer: UIActivity, MFMailComposeViewControllerDelegate {
    
    var emailer : MFMailComposeViewController!
    public var caller : UIViewController!
    
    public class override func activityCategory() -> UIActivityCategory {
        return UIActivityCategory.Share
    }
    
    public override func activityType() -> String? {
        return "superMailer.ToolKit.App"
    }
    
    public override func activityTitle() -> String? {
        return "Super Mailer"
    }
    
//    public override func activityImage() -> UIImage? {
//        var bundle = NSBundle.mainBundle()
//        var bundlePath = "/Users/cs/Library/Developer/CoreSimulator/Devices/BD556DE8-6D18-4C10-8769-56F737F01DD5/data/Containers/Bundle/Application/4E1D2B8A-43EC-4C3D-BA90-A62DC0F39E2D/LDS Apologist.app"
//        var path = bundle.pathForResource("mail-icon", ofType: "png")
//        return UIImage(contentsOfFile: path!)
//    }
    
    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return true
    }
    
    public override func prepareWithActivityItems(activityItems: [AnyObject]) {
        // The array has: subject, body of email, addressee
        var items = activityItems as NSArray
        emailer = MFMailComposeViewController()
        emailer.mailComposeDelegate = self
        var recipient = items[2] as! String
        emailer.setToRecipients([recipient])
        emailer.setMessageBody(items[1] as! String, isHTML: false )
        emailer.setSubject(items[0] as! String)
    }
    
    public override func performActivity() {
        // This is where we send the email
        caller.presentViewController(emailer, animated: true, completion: nil )
    }
    
    public func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        
        if (result.value == MFMailComposeResultSent.value ) {
            // Do good stuff here
        } else {
            // Handle as appropriate
        }
        
        caller.dismissViewControllerAnimated(true , completion: nil )
    }
}