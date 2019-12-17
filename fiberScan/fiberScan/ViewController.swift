//
//  ViewController.swift
//  fiberScan
//
//  Created by Chris on 03/12/2019.
//  Copyright © 2019 Chris. All rights reserved.
//
//

import UIKit
import AVFoundation

class CameraView: UIView {
    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }

    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }

    func updateOrientation() {
        let videoOrientation: AVCaptureVideoOrientation
        switch UIDevice.current.orientation {
        case .portrait:
            videoOrientation = .portrait

        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown

        case .landscapeLeft:
            videoOrientation = .landscapeRight

        case .landscapeRight:
            videoOrientation = .landscapeLeft

        default:
            videoOrientation = .portrait
        }

        layer.connection?.videoOrientation = videoOrientation
    }
}

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var cameraView: CameraView!
    let session = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: "Session Queue")
    var isShowingAlert = false
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
       
        if self.presentedViewController == nil,
            metadataObjects.count > 0,
            metadataObjects.first is AVMetadataMachineReadableCodeObject,
            let scan = metadataObjects.first as? AVMetadataMachineReadableCodeObject{
            
            if let barcode = scan.stringValue, let textile = fakeDataBase[barcode] {
                let info = UIStoryboard(name: "Informations", bundle: nil).instantiateViewController(identifier: "info") as! InformationsViewController
                info.textiles = textile
                let navVC = UINavigationController(rootViewController: info)
                present(navVC, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Produit inconnu", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }

        }
    }
    
    override func loadView() {
        cameraView = CameraView()

        view = cameraView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        sessionQueue.async {
            self.session.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sessionQueue.async {
            self.session.stopRunning()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        cameraView.updateOrientation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    title = "Scan"
        
        session.beginConfiguration()

        if let videoDevice = AVCaptureDevice.default(for: .video) {
            if let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
                session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
            }

            let metadataOutput = AVCaptureMetadataOutput()

            if (session.canAddOutput(metadataOutput)) {
                session.addOutput(metadataOutput)

                metadataOutput.metadataObjectTypes = [
                   
                    .ean13
            
                ]

                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            }
        }

        session.commitConfiguration()

        cameraView.layer.session = session
        cameraView.layer.videoGravity = .resizeAspectFill

        cameraView.updateOrientation()
    }
    }

