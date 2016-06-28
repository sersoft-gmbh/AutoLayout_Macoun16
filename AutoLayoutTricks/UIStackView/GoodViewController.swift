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
    override func createTopViewHeightConstraint() -> NSLayoutConstraint {
        let constraint = super.createTopViewHeightConstraint()
        constraint.priority = 999
        return constraint
    }
}
