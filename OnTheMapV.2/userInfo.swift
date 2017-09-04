//
//  userInfo.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/2/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation

struct UserInfo {
    
    var objectId = String()
    // Description: an auto-generated id/key generated by Parse which uniquely identifies a StudentLocation
    // Example Value: 8ZExGR5uX8
    
    var uniqueKey = String()
    // Description: an extra (optional) key used to uniquely identify a StudentLocation; you should populate this value using your Udacity account id
    // Example Value: 1234
    
    var firstName = String()
    // Description: the first name of the student which matches their Udacity profile first name
    // Example Value: John
    
    var lastName = String()
    // Description: the last name of the student which matches their Udacity profile last name
    // Example Value: Doe
    
    var mapString = String()
    // Description: the location string used for geocoding the student location
    // Example Value: Mountain View, CA
    
    var mediaURL = String()
    // Description: the URL provided by the student
    // Example Value: https://udacity.com
    
    var latitude = Double()
    // Description: the latitude of the student location (ranges from -90 to 90)
    // Example Value: 37.386052
    
    var longitude = Double()
    // Description: the longitude of the student location (ranges from -180 to 180)
    // Example Value: -122.083851
    
    var updatedAt = String()
    // Description: the date when the student location was last updated
    // Example Value: Mar 09, 2015, 23:34
    
    var createdAt = String()
    // Description: the date when the student location was created
    // Example Value: Feb 25, 2015, 01:10
    
    // MARK: Initializers
    // construct a StudentLocation from a dictionary
    init(dictionary: [String:AnyObject]) {
        
        let _objectId = dictionary[ParseClient.JSONResponseKeys.StudentId]
        let _createdAt = dictionary[ParseClient.JSONResponseKeys.CreationDate]
        let _firstName = dictionary[ParseClient.JSONResponseKeys.FirstName]
        let _lastName = dictionary[ParseClient.JSONResponseKeys.LastName]
        let _latitude = dictionary[ParseClient.JSONResponseKeys.Lat]
        let _longitude = dictionary[ParseClient.JSONResponseKeys.Long]
        let _mapString = dictionary[ParseClient.JSONResponseKeys.Place]
        let _mediaURL = dictionary[ParseClient.JSONResponseKeys.Link]
        let _updatedAt = dictionary[ParseClient.JSONResponseKeys.UpdateDate]
        
        self.objectId = _objectId != nil ? _objectId as! String : ""
        self.createdAt = _createdAt != nil ? _createdAt as! String : ""
        self.firstName = _firstName != nil ? _firstName as! String : ""
        self.lastName = _lastName != nil ? _lastName as! String : ""
        self.latitude = _latitude != nil ? _latitude as! Double : 0
        self.longitude = _longitude != nil ? _longitude as! Double : 0
        self.mapString = _mapString != nil ? _mapString as! String : ""
        self.mediaURL = _mediaURL != nil ? _mediaURL as! String : ""
        self.updatedAt = _updatedAt != nil ? _updatedAt as! String : ""
    }
    
    // Creates locations array based on results returned
    static func locationsFromResults(_ results: [[String:AnyObject]]) -> [StudentLocation] {
        var locations = [StudentLocation]()
        
        // For each array in dictionary...
        for result in results {
            // Set first name, last name, and mediaURL
            if let firstName = result[ParseClient.JSONResponseKeys.FirstName] as? String,
                let lastName = result[ParseClient.JSONResponseKeys.LastName] as? String,
                let mediaUrl = result[ParseClient.JSONResponseKeys.Link] as? String {
                // If all are accounted for, add to results
                if !firstName.characters.isEmpty && !lastName.characters.isEmpty && !mediaUrl.characters.isEmpty {
                    locations.append(StudentLocation(dictionary: result))
                }
            }
        }
        // Return results
        return locations
    }
}
