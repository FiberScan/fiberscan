//
//  ViewController.swift
//  fiberScan
//
//  Created by Chris on 03/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Création d'une session
        let session = AVCaptureSession()
        
        //Définition de la caméra
        let captureDevice = AVCaptureDevice
        
    }


}

