//
//  SuccessPopView.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/10/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

@IBDesignable
class SuccessPopView: UIView
{
    var successView:UIView!

    
    @IBAction func okButtonPressed(sender: UIButton)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("RemoveDimView", object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("RemoveAlertPopXib", object: nil)
        self.removeFromSuperview()
    }
    func loadViewFromNib() -> UIView
    {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "SuccessPopView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        successView = loadViewFromNib()
        successView.frame = bounds
        successView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        successView.layer.cornerRadius = 10
        //backgroundView.alpha = 1
        
        addSubview(successView)
        
        
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
