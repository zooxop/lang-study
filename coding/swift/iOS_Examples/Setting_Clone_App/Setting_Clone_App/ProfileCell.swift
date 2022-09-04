//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by 문철현 on 2022/08/17.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    
    
    // awakeFromNib : Table view cell의 처음 시작 부분
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let profileHeight: CGFloat = 60
        profileImageView.layer.cornerRadius = profileHeight / 2  // 이미지 크기의 절반으로 설정하면 원이 된다.
        
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = UIFont.systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
