//
//  GroupsViewController.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/3/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class GroupsViewController: UIViewController,CNContactPickerDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var groupName = ["Bandidos","Diablos","Hells Angels","Highwaymen","Vagos"]
    var lastMessage = ["Toilet Break","Emergency","Flat Tyre","Crash","Food?"]
    var groupImage = ["bandidos","Diablos","hellsangels","highwaymen2","vagos3"]
    
    var newGroupName: String = ""


    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        //let contactPickerViewController = CNContactPickerViewController()
        
        
        
        //contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
        
        //contactPickerViewController.delegate = self
        
        //presentViewController(contactPickerViewController, animated: true, completion: nil)
        
       
    }
    @IBAction func addContactButtonTapped(sender: UIBarButtonItem)
    {
        performSegueWithIdentifier("idSegueAddContactsToGroup", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if newGroupName != ""
        {
            groupName.append(newGroupName)
            lastMessage.append("Default Message")
            groupImage.append("groupContact")
            
        }
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "star")!)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //self.tableView.separatorColor = UIColor(patternImage: UIImage(named: "Background")!)
//        let contactStore = CNContactStore()
//        do {
//            try contactStore.enumerateContactsWithFetchRequest(CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey])) {
//                (contact, cursor) -> Void in
//                self.results.append(contact)
//            }
//        }
//        catch{
//            print("Handle the error please")
//        }
//        
//        print("results = \(results)")
//        print("results = \(results.count)")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

}
extension GroupsViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groupName.count
        //return givenNames.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
//        if lastMessage.last != ""
//        {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        //cell.tintColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        cell.textLabel?.text = groupName[indexPath.row]
        
            cell.detailTextLabel?.text = lastMessage[indexPath.row]
        
        
        
                
//        cell.textLabel?.text = givenNames[indexPath.row]
//            
//        cell.detailTextLabel?.text = familyNames[indexPath.row]
       
        
        let imageName = groupImage[indexPath.row]
        //let imageName = givenNames[indexPath.row]
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
//        }
//        var s = UITableViewCell()
//        return s
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // This code runs when a row is selected
        
        // We'll simply print out the value in the row to a console
        print("\(groupName[indexPath.row]) Selected")
        
        // And with this bit of code we will deselect the row to remove the gray background color, setting animated: true so we can see the transition
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier("idSegueShowGroupDetail", sender: self)

    }
}

extension GroupsViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            tableView.beginUpdates()
            groupName.removeAtIndex(indexPath.row)
            lastMessage.removeAtIndex(indexPath.row)
            groupImage.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            tableView.endUpdates()

        }
    }
}

