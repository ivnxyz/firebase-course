//
//  StudentTableViewCell.swift
//  ExtraID
//
//  Created by Iván Martínez on 30/01/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with student: Student) {
        nameLabel.text = student.name
        idLabel.text = student.accountNumber
    }

}
