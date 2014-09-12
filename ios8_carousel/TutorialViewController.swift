//
//  TutorialViewController.swift
//  ios8_carousel
//
//  Created by Stanley Ng on 9/11/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var actionsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // configure content view
        contentView.sizeToFit()
        
        // configure scroll view
        scrollView.contentSize = contentView.frame.size
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIScrollViewDelegate methods
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        println("TutorialViewController - scrollViewDidEndDecelerating")
        
        // Get the current page based on the scroll offset
        var page: Int = Int(round(scrollView.contentOffset.x / 320))
        println("page = \(page)")
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        // Show / Hide button
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            if page == 3 {
                self.actionsView.alpha = 1
            }
            else {
                self.actionsView.alpha = 0
            }
        })
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
