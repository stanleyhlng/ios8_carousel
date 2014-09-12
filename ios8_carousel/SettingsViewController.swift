//
//  SettingsViewController.swift
//  ios8_carousel
//
//  Created by Stanley Ng on 9/11/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // config content image view
        contentImageView.sizeToFit()
        
        // config scroll view
        scrollView.contentSize = contentImageView.image!.size
        
        // config sign out button
        signOutButton.frame.origin.y = 622
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClose(sender: UIButton) {
    dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSignOut(sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
