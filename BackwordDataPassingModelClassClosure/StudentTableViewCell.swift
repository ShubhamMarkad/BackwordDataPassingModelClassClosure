//
//  StudentTableViewCell.swift
//  BackwordDataPassingModelClassClosure
//
//  Created by Mac on 02/05/35.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var rollNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var persentageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
