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
    override func configuredTopViewConstraints() -> [NSLayoutConstraint] {
        let widthConstraint = topView.widthAnchor.constraintEqualToConstant(50)
        let heightConstraint = topView.heightAnchor.constraintEqualToAnchor(topView.widthAnchor)
        // Fix It
        heightConstraint.priority = 999
        return [widthConstraint, heightConstraint]
    }
}
