//
//  Swift fiberScan.swift
//  fiberScan
//
//  Created by Aldja Kateb on 10/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
import UIKit

let fakeDataBase = ["8445035330890": Textile(brand: "MANGO", barCode: "8445035330890", name: "robe", note: .init(type: .environnement, value: 30, info: "Nul"), type: .dress, favorite: false, image: #imageLiteral(resourceName: "53085022_20"))]

let fakeDataBase2 = ["5855481136712": Textile(brand: "C&A", barCode: "5855481136712", name: "chaussons", note: .init(type: .environnement, value: 30, info: "Nul"), type: .shoes, favorite: false, image: #imageLiteral(resourceName: "2079054-1-08"))]


struct Textile: Equatable {
    var brand: String = ""
    var barCode: String = ""
    var name: String = ""
    var note: Note
    var type: TypeOfClothes
    var favorite: Bool = false
    var image : UIImage?
    static var clothes : [String] = [] // tableau

    enum TypeOfClothes {
        case tshirt, dress, shoes, sheets, pants, underwear, sweater
    }

    enum TypeOfEvaluation {
        case environnement, health, human
    }

    struct Note: Equatable {
        var type: TypeOfEvaluation
        var value: Int
        var info: String
    }
}
