//
//  UdacityConstants.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/2/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation

extension UdacityClient {
    
    // MARK: Constants
    struct Constants {
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "udacity.com"
        static let ApiPath = "/api"
    }
    
    // MARK: Methods
    struct Methods {
        static let Session = "/session"
        static let PublicUserData = "/users/{userId}"
    }
    
    // MARK: URL Keys
    struct URLKeys {
        static let UserID = "userId"
    }
    
    // MARK: JSON Body Keys
    struct JSONBodyKeys {
        static let Udacity = "udacity"
        static let username = "username"
        static let password = "password"

    }
    
    struct JSONResponseKeys {
        
        // Account Keys
        static let Account = "account"
        static let AccountState = "registered"
        static let AccountKey = "key"
        
        // Session Keys
        static let Session = "session"
        static let SessionID = "id"
        static let SessionExpiration = "experation"
        
        // User data
        static let User = "user"
        static let FirstName = "first_name"
        static let LastName = "last_name"
        
    }
}
