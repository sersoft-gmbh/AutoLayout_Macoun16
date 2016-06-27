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
    let emptyView: UIView = {
        let view = UIView()
        view.enableAutoLayout()
        view.backgroundColor = .blueColor()
        view.userInteractionEnabled = false
        return view
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        label.text = "Hallo Macoun!"
        return label
    }()
    
    private(set) lazy var tapGesture: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(BadViewController.exerciseAmbiguity(_:)))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let views = ["view": emptyView, "label": textLabel]
        views.values.forEach(view.addSubview)
        
        let constraints = [
            "H:|-[view]-|",
            "H:|-(>=8)-[label]-(>=8)-|",
            "V:|-(84)-[view]-[label]-(>=20)-|"
            ].constraintsWithViews(views) + [
                textLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor)
        ]
        constraints.activate()
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func exerciseAmbiguity(sender: AnyObject?) {
        if emptyView.hasAmbiguousLayout() {
            print("EmptyView has ambiguous layout")
            emptyView.exerciseAmbiguityInLayout()
        } else {
            print("EmptyView has *no* ambiguous layout")
        }
    }
}
