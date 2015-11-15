//
//  FBController.swift
//  Login
//
//  Created by Girish Satya on 11/14/15.
//  Copyright © 2015 Rishan Girish. All rights reserved.
//

import Foundation
import Firebase

// Firebase reference
let ref = Firebase(url:"https://tempbux.firebaseio.com/")

class FBController {

    class func signupUser() {
        
        ref.authUser("bobtony@example.com", password: "correcthorsebatterystaple",
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                } else {
                    // We are now logged in
                    print("Successfully logged in")
                    
                    let newUserData: NSDictionary = [
                        "email": authData.provider
                    ]
                    
                    ref.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUserData)
                    
                    
                }
        })
    }
    
    
}





