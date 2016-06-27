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
        view.distribution = .EqualSpacing
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(stackView)
        
        let constraints = [
            "H:|-(>=0)-[stackView]-(>=0)-|",
            "V:|-(>=0)-[stackView]-(>=0)-|",
            ].constraintsWithViews(["stackView": stackView]) + [
                stackView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
                stackView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
        ]
        
        constraints.activate()
        
        [topView, bottomView].forEach(stackView.addArrangedSubview)
        
        configuredTopViewConstraints().activate()
    }
    
    func configuredTopViewConstraints() -> [NSLayoutConstraint] {
        let widthConstraint = topView.widthAnchor.constraintEqualToConstant(50)
        let heightConstraint = topView.heightAnchor.constraintEqualToAnchor(topView.widthAnchor)
        return [widthConstraint, heightConstraint]
    }
    
    @IBAction func toggleTopView(sender: AnyObject?) {
        UIView.animateWithDuration(0.3) {
            self.topView.hidden.toggle()
        }
    }
}
