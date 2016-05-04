//
//  Image.swift
//  BluePic
//
//  Created by Alex Buck on 4/29/16.
//  Copyright © 2016 MIL. All rights reserved.
//

import UIKit

class Image: NSObject {

    
    var id : String?
    var caption : String?
    var fileName : String?
    var timeStamp : NSDate?
    var url : String?
    var usersName : String?
    var width : CGFloat?
    var height : CGFloat?
    
    init?(_ dict : [String : AnyObject]) {
        
        super.init()
        
        //if let dict = Utils.convertResponseToDictionary(response){
            
            if let id = dict["_id"] as? String,
                let caption = dict["caption"] as? String,
                let fileName = dict["fileName"] as? String,
                let url = dict["url"] as? String,
                let timeStamp = dict["uploadedTs"] as? String,
                let user = dict["user"] as? [String : AnyObject],
                let usersName = user["name"] as? String {
                
                self.id = id
                self.caption = caption
                self.fileName = fileName
                self.url = url
                self.usersName = usersName
                
                
                if let width = dict["width"] as? String,
                    let height = dict["height"] as? String,
                    let widthNSNumber = NSNumberFormatter().numberFromString(width),
                    let heightNSNumber = NSNumberFormatter().numberFromString(height) {
                    
                    self.width = CGFloat(widthNSNumber)
                    self.height = CGFloat(heightNSNumber)

                }
                
                //set timeStamp
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
                dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
                if let date = dateFormatter.dateFromString(timeStamp) {
                    self.timeStamp = date
                }
                

            }else{
                print("invalid image json")
                return nil
            }
            
//        }
//        else{
//            return nil
//        }
        
    }

    
}