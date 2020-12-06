 //
//  File.swift
//  hackaton
//
//  Created by mendy aouizerat  on 02/12/2020.
 import UIKit
 import AVFoundation
 
 extension ScannerViewController :  AVCaptureMetadataOutputObjectsDelegate{
    
     // if the scanner failed
     func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
     }
     //catch the metadata of the scanner
     func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
         captureSession.stopRunning()

         if let metadataObject = metadataObjects.first {
             guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            
             guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
             found(code: stringValue) {
             }
         }

     }
     // parse the metadata  into movie object
     func found(code: String , callback : @escaping ()->Void) {
        guard let userId = UserDefaults.standard.string(forKey: "userId")else {return}
      
        let scannerLogs:ScannerLogs = ScannerLogs(userId: userId, locationId: code, date: Date())
        dump(scannerLogs.userId)
        let postRequest = APIRequest(endpoint: "scan/")
        postRequest.scan( scannerLogs, completion:{result in
            switch result {
            case .success( _):
                DispatchQueue.main.async {
                    self.successPKHUD(on: self.view)
                }
                
            case.failure( _):
                DispatchQueue.main.async {
                    self.errorPKHUD(on: self.view)
                }
               
            }
        }
                  )}
 
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
 }
 
