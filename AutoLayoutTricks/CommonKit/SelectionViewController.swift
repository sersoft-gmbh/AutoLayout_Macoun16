//
//  SelectionViewController.swift
//  Empty View
//
//  Created by Florian Friedrich on 27/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFFoundation

open class SelectionViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    
    private var firstTime: Bool = true
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = (Application.shared.name ?? "⁉️") + " Sample"
        if firstTime {
            performSegue(withIdentifier: "pushBadVC", sender: nil)
            firstTime = false
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        title = nil
    }
}
