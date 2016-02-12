//
//  ParticipantModel.swift
//  FlagBandit
//
//  Created by Christopher Hayden on 2/4/16.
//  Copyright © 2016 Chris Hayden App House. All rights reserved.
//

import UIKit

class ParticipantModel: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var lblParticipantFirstName: UILabel!

    @IBOutlet weak var lblParticipantFamilyName: UILabel!

}
