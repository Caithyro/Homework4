//
//  CustomTableViewCell.swift
//  Homework 4
//
//  Created by Дмитрий Куприенко on 12.12.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customCellImageView: UIImageView!
    @IBOutlet weak var customCellAgeLabel: UILabel!
    @IBOutlet weak var customCellNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(item: Data) {
        self.customCellNameLabel.text = "My name is \(item.name)"
        self.customCellAgeLabel.text = "I'm \(item.age) year(s) old"
        let imageURL: URL = URL(string: "\(item.image)") ?? URL(string: "https:\\www.google.com")!
        self.customCellImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
