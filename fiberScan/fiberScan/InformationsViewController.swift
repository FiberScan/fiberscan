//
//  InformationsViewController.swift
//  fiberScan
//
//  Created by Aldja Kateb on 11/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
import UIKit

class InformationsViewController: UIViewController, UITableViewDataSource {
    
    var buttonIsSelected = false
    
    
    let textiles: [Textile] = [Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil)]
    
    
    // Produit principal
    @IBOutlet weak var imageMainProduct: UIImageView!
    @IBOutlet weak var nameMainProduct: UILabel!
    @IBOutlet weak var noteMainProduct: UILabel!
    
    @IBOutlet weak var addFavorites: UIButton!
    let emptyHeart = UIImage(named : "heart")
    let fullHeart = UIImage(named : "heart.fill")
    
    
    // TableView
    @IBOutlet weak var tableViewMainProduct: UITableView!
    
    // Produits alternatifs
    @IBOutlet weak var alternativeProducts: UILabel!
    @IBOutlet weak var imageAlternativeProductLeft: UIImageView!
    @IBOutlet weak var nameAlternativeProductLeft: UILabel!
    @IBOutlet weak var scoreAlternativeProductLeft: UILabel!
    @IBOutlet weak var imageAlternativeProductRight: UIImageView!
    
    @IBOutlet weak var nameAlternativeProductRight: UILabel!
    @IBOutlet weak var scoreAlternativeProductRight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewMainProduct.dataSource = self
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textilesToDisplay = textiles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "informationsCell", for: indexPath)
        
        cell.textLabel?.text = "\(textilesToDisplay.name)"

        cell.detailTextLabel?.text = "\(textilesToDisplay.note)"
        
        return cell
    }
    
    /*
    MARK: - Navigation

    In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    Get the new view controller using segue.destination.
    Pass the selected object to the new view controller.
    }
    */
    
    
    
    // Bouton Favoris
    @IBAction func onOffButton(_ sender: Any) {
        buttonIsSelected = !buttonIsSelected
            if buttonIsSelected == true {

            } else if buttonIsSelected == false {

            }
            saveBool(bool: buttonIsSelected)
        }
    
    func saveBool(bool: Bool) {
        if bool == true {
            print("favorite added")
            
        } else if bool == false {
            print("favorite remove")
        }
    }
  
}
    
    

// Code couleur du vert : #2ECC71
