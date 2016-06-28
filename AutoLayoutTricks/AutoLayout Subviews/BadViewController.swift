//
//  BadViewController.swift
//  AutoLayoutTricks
//
//  Created by Florian Friedrich on 27/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFUIKit
import FFFoundation

class BadViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let view = createView()
        view.enableAutoLayout()
        self.view.addSubview(view)
        
        let constraints = [
            "H:|-(>=10)-[view]-(>=10)-|",
            "V:|-(>=10)-[view]-(>=10)-|",
            ].constraintsWithViews(["view": view]) + [
                view.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                view.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        ]
        
        constraints.activate()
    }
    
    func createView() -> UIView {
        return BadView()
    }
}
