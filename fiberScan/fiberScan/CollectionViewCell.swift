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
    
    @IBOutlet weak var buttonDel: UIButton!
    
    weak var viewController: HistoriqueViewController?

    private var textile: Textile!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func deleteElement(_ sender: Any) {
      viewController?.remove(textile: textile)
        }
    
    public func configure(with model: Textile) {
        self.textile = model
        image.image = model.image
    }


    }


