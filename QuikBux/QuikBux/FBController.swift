//
//  FBController.swift
//  Login
//
//  Created by Girish Satya on 11/14/15.
//  Copyright © 2015 Rishan Girish. All rights reserved.
//

import Foundation
import Firebase


class FBController {
    
    // Mainstream signup function
    class func signup(email: String, password: String, callback: (errorPresent: Bool, error: FAuthenticationError) -> Void) {
        myRootRef.createUser(email, password: password,
            withValueCompletionBlock: { error, result in
                
                if error != nil {
                    // There was an error creating the account
                    print("Error in auth")
                    // an error occurred while attempting creation
                    if let errorCode = FAuthenticationError(rawValue: error.code) {
                        callback(errorPresent: true, error: errorCode)
                    }
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    login(email, password: password, callback: callback)
                    
                }
        })
    }
    
    // Creates a subtree for the user after authentication
    class func createUserTree(name: String, type: String, description: String, city: String, callback: (errorPresent: Bool, error: FAuthenticationError) -> Void) {
        
        let newUser: NSDictionary = [
            "name": name,
            "type": type,
            "description": description,
            "city": city
        ]
        
        
        myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid).setValue(newUser) { (error, fb) -> Void in
            if error != nil {
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    callback(errorPresent: true, error: errorCode)
                }
            } else {
                callback(errorPresent: false, error: FAuthenticationError(rawValue: 0)!)
                print("THERE WERE NO ERRORS!!!!!")
            }
        }
    }
    
    class func login(email: String, password: String, callback: (errorPresent: Bool, error: FAuthenticationError) -> Void) {
        myRootRef.authUser(email, password: password) {
            error, authData in
            if error != nil {
                // There was an error creating the account
                print("Error in auth")
                // an error occurred while attempting creation
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    callback(errorPresent: true, error: errorCode)
                }
            } else {
                callback(errorPresent: false, error: FAuthenticationError(rawValue: 0)!)
            }
        }
    }
    
    class func logOut() {
        myRootRef.unauth()
    }
    
    class func getUserType(callback: (result: NSDictionary) -> Void) {
        // Attach a closure to read the data at our posts reference
        let postsRef = myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid)
        postsRef.observeEventType(.Value, withBlock: { snapshot in
            let result = (snapshot.value as! NSDictionary)
            callback(result: result)
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    
    class func uploadPost(description : String, title: String, name: String) {
        
        let post = [
            "title": title,
            "description": description,
            "name": name,
            "uid": myRootRef.authData.uid!]
        
        myRootRef.childByAppendingPath("posts").childByAutoId().setValue(post)
        
/*myRootRef.childByAppendingPath("posts").childByAutoId()
myRootRef.childByAppendingPath("posts").childByAppendingPath(id.key)

myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid).childByAppendingPath("posts").childByAutoId().setValue(id.key)*/
    }

    class func getPosts(callback: (result: NSDictionary) -> Void) {
        // Attach a closure to read the data at our posts reference
        let postsRef = myRootRef.childByAppendingPath("posts")
        postsRef.observeEventType(.Value, withBlock: { snapshot in
            let result = (snapshot.value as! NSDictionary)
            callback(result: result)
            
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    class func filterUsers(callback: (arr: [AnyObject]) -> Void) {
        var str = "";
        var arr: [AnyObject] = [];
        let newRef = myRootRef.childByAppendingPath("users")
        newRef.queryOrderedByChild("type").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let type = snapshot.value["type"] as? String {
                if(type == "worker") {
                    arr.append(snapshot.value)
                    callback(arr: arr)
                }
            }
        })
    }
    
}





