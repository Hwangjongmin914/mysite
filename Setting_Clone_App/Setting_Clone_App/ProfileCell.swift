//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by 시큐웍스 on 2022/02/04.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDesccription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//      let profileHeight = 60
//      profileImageView.layer.cornerRadius = CGFloat(profileHeight / 2)
        profileImageView.layer.cornerRadius = 60 / 2
        
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDesccription.textColor = .darkGray
        bottomDesccription.font = UIFont.systemFont(ofSize: 16)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
