//
//  ParseConvinience.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/2/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation

extension ParseClient {
    
    // MARK: Authentication (GET) Methods
    /*
     Steps for Authentication...
     https://www.themoviedb.org/documentation/api/sessions
     
     Step 1: Create a new request token
     Step 2a: Ask the user for permission via the website
     Step 3: Create a session ID
     Bonus Step: Go ahead and get the user id 😄!
     */
    
    func getStudentLocations(_ completionHandlerForGetStudentLocations: @escaping (_ success: Bool?, _ error: NSError?) -> Void) {
        // 1. Set Parameters
        let mutableMethod: String = Methods.StudentLocation
        let parameters = [ParseClient.ParameterKeys.MaxLocations: 100,
                          ParseClient.ParameterKeys.Order: "-updatedAt"] as [String : Any]
        
        // 2. Make the request
        let _ = self.taskForGETMethod(mutableMethod, parameters: parameters as [String : AnyObject]) { (results, error) in
            
            // 3. Send the desired value(s) to completion handler
            if let error = error {
                completionHandlerForGetStudentLocations(nil, error)
            } else {
                
                if let results = results?[ParseClient.JSONResponseKeys.Results] as? [[String:AnyObject]] {
                    StudentLocations.sharedInstance().locations = StudentLocation.locationsFromResults(results)
                    completionHandlerForGetStudentLocations(true, nil)
                } else {
                    completionHandlerForGetStudentLocations(nil, NSError(domain: "getStudenLocations parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getStudenLocations"]))
                }
            }
        }
    }

}
