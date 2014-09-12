//
//  SignInViewController.swift
//  ios8_carousel
//
//  Created by Stanley Ng on 9/10/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var loginTextImageView: UIImageView!
    @IBOutlet weak var inputsView: UIView!
    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var signingInAlertView: UIAlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // config text field
        self.emailTextField.autocorrectionType = .No
        
        // config keyboard show / hide observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(sender: UIButton) {
        println("SignInViewController - onBack")
        //dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onSignIn(sender: UIButton) {
        println("SignInViewController - onSignIn")
        
        let email = emailTextField.text
        println("email = \(email)")

        let password = passwordTextField.text
        println("password = \(password)")
        
        // Check email
        if email == "" {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address.", delegate: self, cancelButtonTitle: "OK")
            return alertView.show()
        }
        else if !isValidEmail(email) {
            var alertView = UIAlertView(title: "Valid Email Required", message: "Please enter a valid email address.", delegate: self, cancelButtonTitle: "OK")
            return alertView.show()
        }
        
        // Check password
        if password == "" {
            var alertView = UIAlertView(title: "Password Required", message: "Please enter your password for your Dropbox.", delegate: self, cancelButtonTitle: "OK")
            return alertView.show()
        }
        else if !isValidPassword(password) {
            var alertView = UIAlertView(title: "Valid Password Required", message: "Passwords must be at least 6 characters. Please choose a longer password", delegate: self, cancelButtonTitle: "OK")
            return alertView.show()
        }

        signingInAlertView = UIAlertView(title: "Signing in ...", message: nil, delegate: self, cancelButtonTitle: nil)
        signingInAlertView!.show()
        
        // do: sign in
        delay(2, callbackSignIn)
    }
    
    func callbackSignIn()->() {
        println("SignInViewController - callbackSignIn")
        
        self.signingInAlertView!.dismissWithClickedButtonIndex(0, animated: true)
        
        let email = emailTextField.text
        println("email = \(email)")
        
        let password = passwordTextField.text
        println("password = \(password)")
        
        if email == "stanleyhlng@yahoo.com.hk" && password == "password" {
            performSegueWithIdentifier("tutorialFromSignIn", sender: self)
        }
        else {
            var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or passowrd", delegate: self, cancelButtonTitle: "OK")
            return alertView.show()
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func isValidEmail(email:String)->Bool {
        let pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        if let range = email.rangeOfString(pattern, options: .RegularExpressionSearch, range: nil, locale: nil) {
            return true
        }
        else {
            return false
        }
    }
    
    func isValidPassword(password:String)->Bool {
        return countElements(password) >= 6
    }
    
    func willShowKeyboard(notification: NSNotification) {
        
        println("SignInViewController - willShowKeyboard")
        
        var userInfo: NSDictionary = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize: CGSize = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue().size
        println("height: \(kbSize.height), width: \(kbSize.width)")
        
        // reposition views
        //commentView.frame.origin.y = kbSize.height + 20
        
        UIView.animateWithDuration(0.4, animations: {
            
            // reposition login text
            self.loginTextImageView.frame.origin.y = 0
            
            // reposition inputs view
            self.inputsView.frame.origin.y = 60
            
            // reposition action view
            self.actionView.frame.origin.y = kbSize.height + 20
        })
    }
    
    func willHideKeyboard(notification: NSNotification) {
        
        println("SignInViewController - willHideKeyboard")
        
        // reposition views
        //commentView.frame.origin.y = view.frame.height - 48 - commentView.frame.height;
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
