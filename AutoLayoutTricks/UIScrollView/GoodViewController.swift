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

func *=(inout lhs: String?, rhs: Int) {
    lhs = lhs.map { str in (1..<rhs).reduce(str) { $0.0 + " " + str } }
}

class GoodViewController: BadViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text *= 5
        
        contentView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
    }
}
