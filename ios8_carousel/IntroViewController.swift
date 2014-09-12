//
//  IntroViewController.swift
//  ios8_carousel
//
//  Created by Stanley Ng on 9/10/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("IntroViewController - viewDidLoad")
        
        // config content
        contentImageView.sizeToFit()
        
        // config scrollview
        scrollView.contentSize = contentImageView.image!.size
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIScrollViewDelegate methods
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)

        println("IntroViewController - scrollViewDidScroll: offset.y = \(offset)")
        
        // content offset: 0->568
        // x offset: -30->0
        // y offset: -285->0
        
        /*
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)

        var s = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        
        var r = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(s), CGFloat(s))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(r) * M_PI / 180))
        */
        
        
        transformView(tile1View, atIndex: 0, offset: offset)
        transformView(tile2View, atIndex: 1, offset: offset)
        transformView(tile3View, atIndex: 2, offset: offset)
        transformView(tile4View, atIndex: 3, offset: offset)
        transformView(tile5View, atIndex: 4, offset: offset)
        transformView(tile6View, atIndex: 5, offset: offset)
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view: UIView!, atIndex index: Int, offset: Float) {
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[index], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[index], r2Max: 0)
        view.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        
        var s = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[index], r2Max: 1)
        view.transform = CGAffineTransformScale(view.transform, CGFloat(s), CGFloat(s))

        var r = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[index], r2Max: 0)
        view.transform = CGAffineTransformRotate(view.transform, CGFloat(Double(r) * M_PI / 180))
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
