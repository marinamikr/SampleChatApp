//
//  CustomCell.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/12.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setImage(imageData: UIImage) {
        pictureImage.image = imageData
    }
    
    func setName(name: String) {
        nameLabel.text = name
    }
    func setContents(contents: String) {
        contentsLabel.text = contents
    }
}
