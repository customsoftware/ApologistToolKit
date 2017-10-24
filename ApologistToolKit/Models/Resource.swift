//
//  Resource.swift
//  ApologistToolKit
//
//  Created by CustomSoftware on 2/6/15.
//  Copyright (c) 2015 CustomSoftware. All rights reserved.
//

import UIKit
import CloudKit

class Resource: NSObject {
    var url : String!
    var submitted : Date!
    var status : String!
    var Rating : Double!
    var Group : String!
    var Comment : String!
    var doesMoney : Int!
    
    class func fetchResourceRecords(_ recordType : String ) -> NSArray {
//        var publicDatabase : CKDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        return ["One","Two","Three"]
    }
   
}
