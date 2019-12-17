//
//  CollectionViewCellFavoris.swift
//  fiberScan
//
//  Created by Souria ZEGHICHE on 17/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class CollectionViewCellFavoris: UICollectionViewCell {
    @IBOutlet weak var FavorisCollectionViewCell: UIView!
    
    @IBOutlet weak var imagefavoris: UIImageView!
    
    
    @IBOutlet weak var labelfavoris: UILabel!
    
    
    @IBOutlet weak var buttonDelF: UIButton!
    
    
    
    weak var viewController: FavorisViewController?
    
    private var textile: Textile!
    

    
    public func configure(with model: Textile) {
        self.textile = model
        imagefavoris.image = model.image
        labelfavoris.text = String("\(model.note.value) /100")
    }
    
    
    
    @IBAction func buttonDelActionF(_ sender: Any) {
         viewController?.remove(textile: textile)
    }
    
    
    
}
