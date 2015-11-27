//
//  Item+CoreDataProperties.swift
//  grocery-images-cd
//
//  Created by ROHIT GUPTA on 11/23/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var image: NSData?
    @NSManaged var name: String?
    @NSManaged var note: String?
    @NSManaged var qty: String?

}
