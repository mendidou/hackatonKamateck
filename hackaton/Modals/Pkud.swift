//
//  Pkud.swift
//  hackaton
//
//  Created by mendy aouizerat  on 03/12/2020.
//

import Foundation
import PKHUD


protocol PKHUDAble {
}

extension PKHUDAble{
    
    func showProgress(on view : UIView)  {
        HUD.show(.progress, onView: view)
    }
    func successPKHUD( on view : UIView ){
        HUD.flash(.success, onView:view, delay: 1.5, completion: nil)
    }
    func errorPKHUD(on view : UIView){
        HUD.flash(.error, onView:view, delay: 1.5, completion: nil)
    }
}
//give the ability for every VIEWCONTROLLER to use Pkhud
extension UIViewController:PKHUDAble{}
