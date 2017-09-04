//
//  StudentLocations.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/2/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation

class StudentLocations {
    var locations: [StudentLocation] = [StudentLocation]()
    
    class func sharedInstance() -> StudentLocations {
        struct Singleton {
            static var sharedInstance = StudentLocations()
        }
        
        return Singleton.sharedInstance
    }
}
