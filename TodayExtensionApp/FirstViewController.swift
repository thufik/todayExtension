//
//  ViewController.swift
//  TodayExtensionApp
//
//  Created by EquipeSuporteAplicacao on 4/30/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var alertController : UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let alert = alertController{
            self.present(alert, animated: true, completion: nil)
        }
    }
}

