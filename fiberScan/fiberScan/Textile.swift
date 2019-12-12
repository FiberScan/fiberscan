//
//  Swift fiberScan.swift
//  fiberScan
//
//  Created by Aldja Kateb on 10/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
import UIKit

struct Textile {
    var brand: String = ""
    var barCode: String = ""
    var name: String = ""
    var favorite: Bool = false
    var image = UIImage(named:"image")
    static var clothes : [String] = [] // tableau

    enum typeOfClothes {
        case tshirt, dress, shoes, sheets, pants, underwear, sweater
    }

    enum typeOfEvaluation {
        case environnement, health, human
    }

    struct Note {
        var type: typeOfEvaluation
        var value: Int
        var info: String
    }
}
