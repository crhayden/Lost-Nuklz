//
//  CancelPopView.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/10/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

@IBDesignable
class CancelPopView: UIView
{
    var cancelView:UIView!

    @IBAction func okButtonPressed(sender: UIButton)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("RemoveDimView", object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("RemoveAlertPopXib", object: nil)
        self.removeFromSuperview()

    }
    func loadViewFromNib() -> UIView
    {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CancelPopView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        cancelView = loadViewFromNib()
        cancelView.frame = bounds
        cancelView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        cancelView.layer.cornerRadius = 10
        //backgroundView.alpha = 1
        
        addSubview(cancelView)
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        xibSetup()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */


