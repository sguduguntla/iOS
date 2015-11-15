//
//  SignupSecondViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class SignupSecondViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionTextView.backgroundColor = UIColor.clearColor()
    
        let bottomBorder = UIView()
        bottomBorder.frame = CGRectMake(descriptionTextView.frame.origin.x, descriptionTextView.frame.origin.y - 10, descriptionTextView.frame.size.height, 1)
        bottomBorder.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bottomBorder)
        
        let bottomBorder2 = UIView()
        bottomBorder2.frame = CGRectMake(descriptionTextView.frame.origin.x, descriptionTextView.frame.size.width + 10, descriptionTextView.frame.size.height, 1)
        bottomBorder2.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bottomBorder2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

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
