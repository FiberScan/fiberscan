//
//  FavorisViewController.swift
//  fiberScan
//
//  Created by Aldja Kateb on 11/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class FavorisViewController: UIViewController {

    
    @IBOutlet weak var FavorisCollectionView: UICollectionView!
    
    var data: [Textile] = [Textile(brand: "MANGO", barCode: "8445035330890", name: "robe", note: .init(type: .environnement, value: 37, info: "Nul"), type: .dress, favorite: true, image: #imageLiteral(resourceName: "53085022_20")), Textile(brand: "C&A", barCode: "5855481136712", name: "chaussons", note: .init(type: .environnement, value: 30, info: "Nul"), type: .shoes, favorite: true, image: #imageLiteral(resourceName: "2079054-1-08")), Textile(brand: "SMT", barCode: "123456", name: "chemise", note: Textile.Note(type: .health, value: 26, info: "blabla"), type: .chemise, favorite: false, image: #imageLiteral(resourceName: "c5-680x680")), Textile(brand: "SMT", barCode: "123456", name: "veste", note: Textile.Note(type: .health , value: 64, info: "blabla"), type: .costume, favorite: false, image: #imageLiteral(resourceName: "shopping")), Textile(brand: "SMT", barCode: "123456", name: "costume", note: Textile.Note(type: .health, value: 32, info: "blabla"), type: .costume, favorite: false, image: #imageLiteral(resourceName: "veste-de-costume-regular-en-twill-bleu-marine-homme-ti550_2_fcf1"))]


    var favorited : [Textile] = []
    
    func filtre() {
        for i in 1...data.count {
            let indexN = i - 1
            if data[indexN].favorite == true {
            favorited.append(data[indexN])
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtre()
        FavorisCollectionView.dataSource = self
        FavorisCollectionView.delegate = self

        
        // Do any additional setup after loading the view.
    }
    func remove(textile: Textile) {
              guard let index = favorited.firstIndex(of: textile) else { return }
              favorited.remove(at: index)
              FavorisCollectionView.reloadData()
          }
    
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/






extension FavorisViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        filtre()
        return favorited.count
        //}
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.destination is InformationsViewController {
               }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellf", for: indexPath) as? CollectionViewCellFavoris
              cell?.configure(with: favorited[indexPath.row])
              cell?.viewController = self
    
              return cell!
          }
    }


