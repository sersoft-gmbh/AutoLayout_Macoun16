//
//  BadViewController.swift
//  Invisible Layouts
//
//  Created by Daniel Friedrich on 16/09/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFUIKit
import FFFoundation

class BadViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func changeLanguage(sender: AnyObject) {
        outputLabel.text = "Meine sehr ausführliche deutsche Übersetzung des tollen Labels"
    }
    
}
