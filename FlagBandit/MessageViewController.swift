//
//  MessageViewController.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/5/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var groupName: String = ""
    
    var membersFirstNameList: [String] = []
    var membersFamilyNameList: [String] = []
    
    var popUpView: AlertPopView!
    
    var buttons: [UIButton] = []
    
    @IBOutlet weak var restRoomButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var gasButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var policeButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        //navigationItem.titleView = lblGroupName
        //self.view.addSubview(backgroundView)
        self.title = groupName
        //backgroundView.alpha = 0.5
        //view.layer.cornerRadius = 10
        
        buttons = [restRoomButton, stopButton, gasButton, foodButton, emergencyButton, policeButton]
        
        for var b in buttons
        {
            b.layer.cornerRadius = 10
            b.layer.shadowColor = UIColor.blackColor().CGColor
            b.layer.shadowOffset = CGSizeMake(5, 5)
            b.layer.shadowRadius = 2
            b.layer.shadowOpacity = 1.0
            b.titleLabel?.font = UIFont.systemFontOfSize(39)
            
            //b.frame = CGRectMake(<#T##x: CGFloat##CGFloat#>, <#T##y: CGFloat##CGFloat#>, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //b.frame.origin = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        }




        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ReactivateVC:", name: "RemoveDimView", object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    @IBOutlet weak var backGroundDimView: UIView!
    @IBAction func pissBreakButtonPressed(sender: UIButton)
    {
        let alertController = UIAlertController(title: "Are you sure you want to send this message", message: "Toilet break?", preferredStyle: UIAlertControllerStyle.Alert)
//        let image = UIImage(named: "toiletbreak3")
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: cleartoSend)
        let dismiss = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        

//        //dismiss.setValue(image, forKey: "image")
//        
        alertController.addAction(ok)
        alertController.addAction(dismiss)
        
        presentViewController(alertController, animated: true, completion: nil)

    }
    @IBAction func flatTireButtonPressed(sender: UIButton)
    {
        if backGroundDimView.hidden
        {
            self.view.addSubview(backGroundDimView)
            backGroundDimView.hidden = false
            backGroundDimView.backgroundColor = UIColor.blackColor()
            backGroundDimView.alpha = 0.4
        }

        
        
        //self.view.alpha = 0.5
        //backgroundView.hidden = true
        //backgroundView.alpha = 0.5
        self.popUpView = AlertPopView(frame: CGRect(x: 50, y: 150, width: 300, height: 500))
        self.view.addSubview(popUpView)
        
        //UIView.transitionWithView(self.view, duration: 0.5, options:UIViewAnimationOptions.CurveEaseInOut,animations: {self.view.addSubview(createAnAccountView)}, completion: nil)
        UIView.transitionWithView(self.view, duration: 0.5, options:UIViewAnimationOptions.CurveEaseInOut,animations: {self.view.addSubview(self.popUpView)}, completion: nil)

        
        
    }
    func cleartoSend(alert: UIAlertAction!)
    {
        
    }
    @IBOutlet weak var lblGroupName: UILabel!

    @IBAction func backButtonPressed(sender: UIBarButtonItem)
    {
        performSegueWithIdentifier("idSegueToGroups", sender: self)

    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "idSegueToGroups"
        {
            let detailVC: GroupsViewController = segue.destinationViewController as! GroupsViewController
            detailVC.newGroupName = groupName
//            detailVC.participantFamilyNameList = checkedFamilyNameList
//            
//            print("checkedFirstNameList = \(checkedFirstNameList)")
//            print("checkedFamilyNameList = \(checkedFamilyNameList)")
            
        }
    }
    
    func ReactivateVC(notification : NSNotification)
    {
        //backGroundDimView.removeFromSuperview()
        backGroundDimView.hidden = true
        //self.view.addSubview(backGroundDimView)

        //self.view.addSubview(bkVIew)
        //bkView.backgroundColor = UIColor.clearColor()
        //bkView.alpha = 1.0
        //self.setNeedsFocusUpdate()
        //self.view.userInteractionEnabled = true
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
