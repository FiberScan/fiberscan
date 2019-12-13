//
//  EnvironnementDetailViewController.swift
//  fiberScan
//
//  Created by vauche bruno on 12/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class EnvironnementDetailViewController: UIViewController {
    @IBOutlet weak var onOffButton: UIButton!
    var buttonIsSelected = false
    var changeFav = Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        buttonIsSelected = !buttonIsSelected
        if buttonIsSelected == true {
        } else if buttonIsSelected == false {
        }
        saveBool(bool: buttonIsSelected)
    }
    
    func saveBool(bool: Bool) {
        if bool == true {
          changeFav.favorite = bool
              onOffButton.setImage(UIImage (systemName: "heart.fill"), for: .normal)
          print("favorite added")
          print(changeFav.favorite)
        }else if bool == false {
          changeFav.favorite = bool
              onOffButton.setImage(UIImage (systemName: "heart"), for: .normal)
              print("favorite remove")
          print(changeFav.favorite)
        }
    }
    

}
