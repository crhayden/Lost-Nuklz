//
//  AddGroupViewController.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/5/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

class AddGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{    
    var participantFirstNameList: [String] = []
    var participantFamilyNameList: [String] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.clearColor()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "star")!)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var txtEnterGroupName: UITextField!
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)

    }
    @IBAction func createGroupButtonPressed(sender: UIBarButtonItem)
    {
        let newGroupName: String = txtEnterGroupName.text!
        performSegueWithIdentifier("idSegueCreateNewGroup", sender: self)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "idSegueCreateNewGroup"
        {
            let detailVC: MessageViewController = segue.destinationViewController as! MessageViewController
            detailVC.groupName = txtEnterGroupName.text!
            detailVC.membersFirstNameList = participantFirstNameList
            detailVC.membersFamilyNameList = participantFamilyNameList
//            
//            print("checkedFirstNameList = \(checkedFirstNameList)")
//            print("checkedFamilyNameList = \(checkedFamilyNameList)")
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return participantFirstNameList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: ParticipantModel = tableView.dequeueReusableCellWithIdentifier("idParticipantCell") as! ParticipantModel
        cell.backgroundColor = UIColor.clearColor()
        cell.lblParticipantFirstName.textColor = UIColor.whiteColor()
        cell.lblParticipantFamilyName.textColor = UIColor.whiteColor()


        cell.lblParticipantFirstName.text = participantFirstNameList[indexPath.row]
        cell.lblParticipantFamilyName.text = participantFamilyNameList[indexPath.row]
        //tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.Bottom)
        //cell.accessoryType = .None
        print("participantFirstNameList = \(participantFirstNameList)")
        print("participantFamilyNameList = \(participantFamilyNameList)")
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
//        print("participantFirstNameList = \(participantFirstNameList)")
//        print("participantFamilyNameList = \(participantFamilyNameList)")
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
