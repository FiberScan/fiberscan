//
//  InformationsViewController.swift
//  fiberScan
//
//  Created by Aldja Kateb on 11/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class InformationsViewController: UITableViewController {
    
    // Textile
    var textiles = Textile(brand: "", barCode: "", name: "", note: Textile.Note(type: .health , value: 34, info: ""), type: .dress, favorite: false, image: nil)
    
    
    // Produit principal
    @IBOutlet weak var imageMainProduct: UIImageView!
    @IBOutlet weak var nameMainProduct: UILabel!
    @IBOutlet weak var noteMainProduct: UILabel!
    
    
    // Bouton Favori
    @IBOutlet weak var onOffButton: UIButton!
     var buttonIsSelected = false

    
    
    // TableView
    @IBOutlet weak var cellHumain: UITableViewCell!
    @IBOutlet weak var scoreCellHumain: UILabel!
    
    @IBOutlet weak var cellEnvironnement: UITableViewCell!
    @IBOutlet weak var scoreCellEnvironnement: UILabel!
    
    @IBOutlet weak var cellSante: UITableViewCell!
    @IBOutlet weak var scoreCellSante: UILabel!
    
    
    // Produits alternatifs
    @IBOutlet weak var imageAlternativeProductLeft: UIImageView!
    @IBOutlet weak var nameAlternativeProductLeft: UILabel!
    @IBOutlet weak var noteAlternativeProductLeft: UILabel!
    
    @IBOutlet weak var imageAlternativeProductRight: UIImageView!
    @IBOutlet weak var nameAlternativeProductRight: UILabel!
    @IBOutlet weak var noteAlternativeProductRight: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    /*
    MARK: - Navigation

    In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    Get the new view controller using segue.destination.
    Pass the selected object to the new view controller.
    }
    */
    
    // Sélectionné le bouton Favori
    @IBAction func buttonPressed(_ sender: Any) {
        buttonIsSelected = !buttonIsSelected
            if buttonIsSelected == true {
            } else if buttonIsSelected == false {
            }
            saveBool(bool: buttonIsSelected)
        }
    
    // Donner sa couleur au bouton Favori
    func saveBool(bool: Bool) {
        if bool == true {
            textiles.favorite = bool
                onOffButton.setImage(UIImage (systemName: "heart.fill"), for: .normal)
            print("favorite added")
            print(textiles.favorite)
        } else if bool == false {
            textiles.favorite = bool
                onOffButton.setImage(UIImage (systemName: "heart"), for: .normal)
                print("favorite remove")
            print(textiles.favorite)
        }
    }

}

    
    



// Code couleur du vert : #2ECC71
