//
//  ViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // Firebase testing
        FBController.testFB()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UI Setup
    func setupUI() {
        // Email text field UI setup
        emailTextField.backgroundColor = UIColor.clearColor()
        emailTextField.text = ""
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let bottomBorder1 = CALayer()
        bottomBorder1.frame = CGRectMake(0.0, emailTextField.frame.size.height - 1, emailTextField.frame.size.width, 1.0);
        bottomBorder1.backgroundColor = UIColor.whiteColor().CGColor
        emailTextField.layer.addSublayer(bottomBorder1)
        
        // Password text field UI setup
        passwordTextField.backgroundColor = UIColor.clearColor()
        passwordTextField.text = ""
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRectMake(0.0, passwordTextField.frame.size.height - 1, passwordTextField.frame.size.width, 1.0);
        bottomBorder2.backgroundColor = UIColor.whiteColor().CGColor
        passwordTextField.layer.addSublayer(bottomBorder2)
        
        // Signup button UI setup
        signupButton.backgroundColor = UIColor.clearColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // Login button UI setup
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    // MARK: UITextFieldDelegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

