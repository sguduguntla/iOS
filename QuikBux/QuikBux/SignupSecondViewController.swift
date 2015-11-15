//
//  SignupSecondViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class SignupSecondViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var whichLabel: UILabel!
    @IBOutlet weak var workerImageView: UIButton!
    @IBOutlet weak var clientImageView: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    func setupUI() {
        // Text view UI
        descriptionTextView.backgroundColor = UIColor.clearColor()
        descriptionTextView.layer.borderColor = UIColor.whiteColor().CGColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 5
        
        // Signup button UI
        signupButton.backgroundColor = UIColor.clearColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    // MARK: UITextViewDelegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
