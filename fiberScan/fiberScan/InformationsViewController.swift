//
//  InformationsViewController.swift
//  fiberScan
//
//  Created by Aldja Kateb on 11/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class InformationsViewController: UIViewController, UITableViewDataSource {
    
    var buttonIsSelected = false
    
    struct Information {
        var category: String
        var score: String
    }
    
    let informations: [Information] = [Information(category: "Humain", score: "30/100"), Information(category: "Environnement", score: "32/100"), Information(category: "Santé", score: "31/100")]
    
    
    // Produit principal
    @IBOutlet weak var imageMainProduct: UIImageView!
    @IBOutlet weak var nameMainProduct: UILabel!
    @IBOutlet weak var noteMainProduct: UILabel!
    
    @IBOutlet weak var addFavorites: UIButton!
        let image1 = UIImage(named: "empty") as UIImage?
        let image2 = UIImage(named: "filled") as UIImage?
    
    
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
        return informations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let informationsToDisplay = informations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "informationsCell", for: indexPath)
        
        cell.textLabel?.text = "\(informationsToDisplay.category)"
        
        cell.detailTextLabel?.text = informationsToDisplay.score
        
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
                addFavorites.tintColor = .systemGreen
            } else if buttonIsSelected == false {
                addFavorites.tintColor = .systemBlue
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
    
    
