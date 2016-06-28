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
    let stackView: UIStackView = {
        let view = UIStackView()
        view.enableAutoLayout()
        view.axis = .Vertical
        view.spacing = 20
        view.alignment = .Center
        view.distribution = .EqualCentering
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.enableAutoLayout()
        view.backgroundColor = .blueColor()
        view.layer.cornerRadius = 25
        return view
    }()
    
    private(set) lazy var bottomView: UIButton = {
        let button = UIButton(type: .System)
        button.enableAutoLayout()
        button.addTarget(self, action: #selector(BadViewController.toggleTopView(_:)), forControlEvents: .TouchUpInside)
        button.setTitle("Mal da, mal weg", forState: .Normal)
        return button
    }()
    
    private var topViewWidthConstraint: NSLayoutConstraint!
    private var topViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(stackView)
        
        topViewWidthConstraint = createTopViewWidthConstraint()
        topViewHeightConstraint = createTopViewHeightConstraint()
        
        let constraints = [
            "H:|-(>=0)-[stackView]-(>=0)-|",
            "V:|-(>=0)-[stackView]-(>=0)-|",
            ].constraintsWithViews(["stackView": stackView]) + [
                stackView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
                stackView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
                topViewWidthConstraint,
                topViewHeightConstraint
        ]
        
        constraints.activate()
        
        [topView, bottomView].forEach(stackView.addArrangedSubview)
    }
    
    func createTopViewWidthConstraint() -> NSLayoutConstraint {
        return topView.widthAnchor.constraintEqualToConstant(50)
    }
    
    func createTopViewHeightConstraint() -> NSLayoutConstraint {
        return topView.heightAnchor.constraintEqualToConstant(50)
    }
    
    @IBAction func toggleTopView(sender: AnyObject?) {
        UIView.animateWithDuration(0.3) {
            // Force layout cycle
            self.topViewHeightConstraint.active.toggle()
            // Adds a 0-Height constraint (created by UIStackView)
            self.topView.hidden.toggle()
        }
    }
}
