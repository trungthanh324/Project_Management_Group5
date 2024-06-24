//
//  DetailVCTableViewCell.swift
//  ProjectManagement
//
//  Created by 1 0 1 1  on 2/6/24.
//

import UIKit

class DetailVCTableViewCell: UITableViewCell {

    @IBOutlet weak var lbcolor: UILabel!
    @IBOutlet weak var lbmodel: UILabel!
    @IBOutlet weak var lbid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
