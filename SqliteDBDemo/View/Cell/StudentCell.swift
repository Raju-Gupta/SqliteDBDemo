//
//  StudentCell.swift
//  SqliteDBDemo
//
//  Created by Raju Gupta on 29/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblMarks : UILabel!
    @IBOutlet weak var lblRollNo : UILabel!
    @IBOutlet weak var btnEdit : UIButton!
    @IBOutlet weak var btnDelete : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
