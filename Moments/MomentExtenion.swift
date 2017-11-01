//
//  MomentExtenion.swift
//  Moments
//
//  Created by user on 06/08/1939 Saka.
//  Copyright © 1939 Saka user. All rights reserved.
//

import Foundation
import CloudKit

extension Moment {
    
    func toICloudRecord() -> CKRecord {
        
        let record = CKRecord(recordType: "Moment")

        record["name"] = self.name as CKRecordValue?
        record["desc"] = self.desc as CKRecordValue?
        record["momentTime"] = self.momentTime as CKRecordValue?
        record["createdAt"] = self.createdAt as CKRecordValue?
        record["modifiedAt"] = self.modifiedAt as CKRecordValue?
        record["day"] = self.day as CKRecordValue?
        record["month"] = self.month as CKRecordValue?
        record["year"] = self.year as CKRecordValue?
        
        return record
    }
    
    
    func fromICloudRecord(record: CKRecord) -> Moment{

        self.name = record.object(forKey: "name") as! String?
        self.desc = record.object(forKey: "desc") as! String?
        self.momentTime = record.object(forKey: "momentTime") as! NSNumber? as! Int64
        self.createdAt = record.object(forKey: "createdAt") as! NSNumber? as! Int64
        self.modifiedAt = record.object(forKey: "modifiedAt") as! NSNumber? as! Int64
        self.day = record.object(forKey: "day") as! NSNumber? as! Int16
        self.month = record.object(forKey: "month") as! NSNumber? as! Int16
        self.year = record.object(forKey: "year") as! NSNumber? as! Int16
        
        return self
    }
}

