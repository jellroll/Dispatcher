//
//  ApiKeys.swift
//  Dispatcher
//
//  Created by Jennifer Brisbane on 5/31/15.
//  Copyright (c) 2015 jellroll. All rights reserved.
//

import Foundation

func valueForAPIKey(#keyname:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = plist?.objectForKey(keyname) as! String
    return value
}