//
//  ViewController.swift
//  hackaton
//
//  Created by mendy aouizerat  on 02/12/2020.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var id: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        if id.text == nil {
         errorPKHUD(on: self.view)
         return
        }else{

            UserDefaults.standard.set(id.text!, forKey: "id")
            let logs:Logs = Logs(id: id.text!)
            dump(logs)
            let postRequest = APIRequest(endpoint: "auth/login")
            postRequest.login(logs, completion:{result in
                switch result {
                case .success(let id):
                    print(id)
                    self.defaults.set(id.id, forKey: "userId")
                    DispatchQueue.main.async {
                        self.successPKHUD(on: self.view)
                        self.performSegue(withIdentifier: "toScanner", sender: nil)

                    }
                    
                    
                case.failure( _):
                    print("er")
                    DispatchQueue.main.async {
                        self.errorPKHUD(on: self.view)
                    }
                   
                }
    
                
            } )
            
            
            
            
        }
        
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = defaults.string(forKey: "id") {
            self.id.text! = id
           
        }
    }


}

