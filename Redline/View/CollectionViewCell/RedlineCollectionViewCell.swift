//
//  RedlineCollectionViewCell.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import UIKit
import Foundation

class RedlineCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    
    var contentModel:ContentModel? {
        didSet {
            guard let contentModel = contentModel else {return}
            // set the content title
            self.contentTitle.text = contentModel.title
            // set the content image
            if let imageName = contentModel.image {
                if let image = UIImage(named: imageName) {
                    self.contentImage.image = image
                }else {
                    self.contentImage.image = UIImage(named: Constants.placeholderImage)
                }
            }
        }
    }
}
