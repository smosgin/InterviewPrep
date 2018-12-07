//
//  XenoTableViewCell.swift
//  InterviewPrep
//
//  Created by Seth Mosgin on 12/6/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit

class XenoTableViewCell: UITableViewCell {
    
    @IBOutlet var genericTextLabel: UILabel?
    @IBOutlet var specificTextLabel: UILabel?
    @IBOutlet var englishTextLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
