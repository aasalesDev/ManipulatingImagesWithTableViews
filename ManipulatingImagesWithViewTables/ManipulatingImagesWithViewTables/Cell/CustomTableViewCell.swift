//
//  CustomTableViewCell.swift
//  ManipulatingImagesWithViewTables
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var flagLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCustomCell(name: String?, image: UIImage?){
        flagLabel.text = name
        if image != nil {
            flagImageView.image = image
        } else {
            flagImageView.image = UIImage(named: "noImage")
        }
    }
}
