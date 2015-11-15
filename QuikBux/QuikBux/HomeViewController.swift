//
//  ViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logoImage.layer.cornerRadius = logoImage.frame.size.height/2
        logoImage.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

