//
//  SelectionViewController.swift
//  Empty View
//
//  Created by Florian Friedrich on 27/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFFoundation

public class SelectionViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        title = (App.name ?? "⁉️") + " Sample"
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        title = nil
    }
}
