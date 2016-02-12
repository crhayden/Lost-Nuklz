//
//  ContactsViewController.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/4/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var contactStore = CNContactStore()
    var results: [CNContact] = []
    
    var givenNames: [String] = []
    var familyNames: [String] = []
    var checkedFirstNameList: [String] = []
    var checkedFamilyNameList: [String] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.clearColor()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "star")!)
        let contactStore = CNContactStore()
        var results: [CNContact] = []
        do {
            try contactStore.enumerateContactsWithFetchRequest(CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey ])) {
                (contact, cursor) -> Void in
                results.append(contact)
            }
        }
        catch{
            print("Handle the error please")
        }
        for n in results
        {
            givenNames.append(n.givenName)
            familyNames.append(n.familyName)
        }
        print("results = \(results)")
        print("results = \(results.count)")
        
        // Do any additional setup after loading the view.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "idSegueAddGroupName"
        {
            let detailVC: AddGroupViewController = segue.destinationViewController as! AddGroupViewController
            detailVC.participantFirstNameList = checkedFirstNameList
            detailVC.participantFamilyNameList = checkedFamilyNameList
            
            print("checkedFirstNameList = \(checkedFirstNameList)")
            print("checkedFamilyNameList = \(checkedFamilyNameList)")

        }
    }
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var contactsTableView: UITableView!

    @IBAction func doneButtonPressed(sender: UIBarButtonItem)
    {
        performSegueWithIdentifier("idSegueCreateGroupName", sender: self)

    }
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return givenNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: ContactModel = tableView.dequeueReusableCellWithIdentifier("idContactCell") as! ContactModel
        cell.backgroundColor = UIColor.clearColor()
        cell.lblContactFirstName.textColor = UIColor.whiteColor()
        cell.lblContactFamilyName.textColor = UIColor.whiteColor()

        cell.lblContactFirstName.text = givenNames[indexPath.row]
        cell.lblContactFamilyName.text = familyNames[indexPath.row]
        //tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.Bottom)
        cell.accessoryType = .None

        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cellDetail: ContactModel = tableView.cellForRowAtIndexPath(indexPath) as! ContactModel

        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            if cell.accessoryType == .Checkmark
            {
                cell.accessoryType = .None
            }
            else
            {
                checkedFirstNameList.append(cellDetail.lblContactFirstName.text!)
                checkedFamilyNameList.append(cellDetail.lblContactFamilyName.text!)
                cell.accessoryType = .Checkmark
                //doneButton.enabled = true
            }
        }
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
