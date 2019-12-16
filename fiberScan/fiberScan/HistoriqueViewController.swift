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
//    let firstNote = (Textile.Note(type: .health, value: 34, info: "blabla")
//    let secondNote = Textile.Note(type: .human, value: 50, info: "blabla")
//    let thirdNote = Textile.Note(type: .environnement, value: 44, info: "blabla")
    
    var data: [Textile] = [Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health, value: 34, info: "blabla"), type: .dress, favorite: false, image: nil), Textile(brand: "SMT", barCode: "123456", name: "robe", note: Textile.Note(type: .health , value: 34, info: "blabla"), type: .dress, favorite: false, image: nil)]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        }
    
        func remove(textile: Textile) {
            guard let index = data.firstIndex(of: textile) else { return }
            data.remove(at: index)
            collectionView.reloadData()
        }
    //
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
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.destination is InformationsViewController {
//            data[indexPath.row]
            
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        cell?.configure(with: data[indexPath.row])
        cell?.viewController = self
        return cell!
    }
}

