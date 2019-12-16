//
//  HistoriqueViewController.swift
//  fiberScan
//
//  Created by Aldja Kateb on 11/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit

class HistoriqueViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let vet = Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil)
    let s = Textile.clothes
    let data: [Textile] = [Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil) ]
//    let p = [vet, vet, vet, vet, vet, vet, vet, vet, vet, vet, vet, vet]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
//#imageLiteral(resourceName: "")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    extension HistoriqueViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let p = [vet, vet, vet, vet, vet, vet, vet, vet, vet, vet, vet, vet]
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        cell?.configure(with: data[indexPath.row])
        return cell!
    }
}
//
