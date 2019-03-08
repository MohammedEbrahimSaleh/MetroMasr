//
//  dierctionTableViewCell.swift
//  MetroMasr
//
//  Created by Other user on 3/4/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class dierctionTableViewCell: UITableViewCell {

    @IBOutlet weak var directionLbl: UILabel!
    @IBOutlet weak var directionImage: UIImageView!
    
    @IBOutlet weak var cellLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
