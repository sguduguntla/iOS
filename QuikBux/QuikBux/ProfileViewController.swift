//
//  ProfileViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/15/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid).valueForKeyPath("name") as? String
        
        cityTextField.text = myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid).valueForKeyPath("city") as? String
        
        descriptionTextField.text = myRootRef.childByAppendingPath("users").childByAppendingPath(myRootRef.authData.uid).valueForKeyPath("description") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
