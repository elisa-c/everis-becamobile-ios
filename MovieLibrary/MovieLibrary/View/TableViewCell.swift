//
//  TableViewCell.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 30/03/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterCell: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
