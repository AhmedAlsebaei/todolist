//
//  taskcell.swift
//  todolist
//
//  Created by ahmed aelsebaay on 18/04/2021.
//

import UIKit

class taskcell: UITableViewCell {

    @IBOutlet weak var tasklabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
