//
//  Swift fiberScan.swift
//  fiberScan
//
//  Created by Aldja Kateb on 10/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
import UIKit

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
