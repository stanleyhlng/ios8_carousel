//
//  FeedViewController.swift
//  ios8_carousel
//
//  Created by Stanley Ng on 9/11/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("FeedViewController - viewDidLoad")
        
        // config image content view
        contentImageView.sizeToFit()
        
        // config scroll view
        var size: CGSize = CGSizeMake(contentImageView.image!.size.width, contentImageView.image!.size.height + 66)
        scrollView.contentSize = size
    }

    override func viewDidAppear(animated: Bool) {
        scrollView.contentInset = UIEdgeInsetsZero
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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