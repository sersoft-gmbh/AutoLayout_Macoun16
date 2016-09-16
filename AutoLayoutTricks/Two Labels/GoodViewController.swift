//
//  GoodViewController.swift
//  AutoLayoutTricks
//
//  Created by Florian Friedrich on 27/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFUIKit
import FFFoundation

class GoodViewController: BadViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Fix it
        firstLabel.setContentCompressionResistancePriority(755, for: .horizontal)
        secondLabel.setContentHuggingPriority(255, for: .horizontal)
    }
}
