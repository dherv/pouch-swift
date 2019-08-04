//
//  ExpenseTableViewCell.swift
//  pouch
//
//  Created by Damien Hervieux on 2019/07/30.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var expenseNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
