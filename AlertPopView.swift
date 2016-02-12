//
//  AlertPopView.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/9/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

@IBDesignable
class AlertPopView: UIView {

@IBOutlet weak var backgroundView: UIView!
    
    var view:UIView!
    var cancelPopView: CancelPopView!
    var successPopView: SuccessPopView!
    //var animatedView: AnimatableView?
    @IBAction func yesButtonPressed(sender: UIButton)
    {
        self.successPopView = SuccessPopView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        self.view.addSubview(successPopView)
    }
    
    @IBAction func noButtonPressed(sender: UIButton)
    {
        //UIView.transitionWithView(self.view, duration: 0.5, options:UIViewAnimationOptions.CurveEaseInOut,animations: {self.view.addSubview(self.cancelPopView)}, completion: nil)
//        UIView.animateWithDuration(0.4, animations: {() -> Void in
//            self.frame = CGRectOffset(self.frame, 0, 300)
//            self.cancelPopView.frame = CGRectOffset(self.cancelPopView.frame, 0, 300)})

        self.cancelPopView = CancelPopView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        self.view.addSubview(cancelPopView)

    }
func loadViewFromNib() -> UIView
{
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: "AlertPopView", bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    
    return view
}

func xibSetup() {
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    view.layer.cornerRadius = 10
    //backgroundView.alpha = 1
    
    addSubview(view)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "RemoveXib:", name: "RemoveAlertPopXib", object: nil)

}

override init(frame: CGRect) {
    super.init(frame: frame)
    
    xibSetup()
}

required init(coder aDecoder: NSCoder)
{
    super.init(coder: aDecoder)!
    
    xibSetup()
}
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func RemoveXib(notification : NSNotification)
    {
        self.removeFromSuperview()
    }

}



class AnimatableView: UIView {
    func animate(){
        print("Should overide by subclasss", terminator: "")
    }
}
