//
//  MarvelTableViewCell.swift
//  Marvel
//
//  Created by Kadır  Yıldız on 31.08.2022.
//

import Foundation
import UIKit


class MarvelTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var marvelImage: UIImageView!
    @IBOutlet weak var marvelName: UILabel!
    
    //MARK: Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerView.dropShadow(cornerRadius: 12)
        self.innerView.layer.borderColor = UIColor.black.cgColor
        self.innerView.layer.borderWidth = 1
        self.innerView.layer.cornerRadius = 8
        self.innerView.clipsToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
