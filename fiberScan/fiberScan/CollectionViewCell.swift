//
//  CollectionViewCell.swift
//  fiberScan
//
//  Created by Natalia Vega on 13/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Textile) {
        image.image = model.image
    }
}
