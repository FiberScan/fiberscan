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
    
    var data: [Textile] = [Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health, value: 34, info: "blabla"), type: .dress, favorite: true, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: true, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health, value: 34, info: "blabla"), type: .dress, favorite: false, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health, value: 34, info: "blabla"), type: .dress, favorite: false, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil)]
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavorisCollectionView.dataSource = self
        FavorisCollectionView.delegate = self

        
        // Do any additional setup after loading the view.
    }
    func remove(textile: Textile) {
              guard let index = data.firstIndex(of: textile) else { return }
              data.remove(at: index)
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
        //if data[0].favorite == true {
        return data.count
        //}
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.destination is InformationsViewController {
               }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellf", for: indexPath) as? CollectionViewCellFavoris
              cell?.configure(with: data[indexPath.row])
              cell?.viewController = self
    
              return cell!
          }
    }


