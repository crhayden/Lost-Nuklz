//
//  ContactCell.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/4/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

class ContactModel: UITableViewCell
{
    var checked: Bool = false

    @IBOutlet weak var lblContactFirstName: UILabel!
    @IBOutlet weak var lblContactFamilyName: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
