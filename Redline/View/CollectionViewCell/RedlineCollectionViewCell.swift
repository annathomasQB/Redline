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
            self.contentTitle.text = contentModel.title
            self.contentImage.image = UIImage(named: contentModel.image)
        }
    }
}
