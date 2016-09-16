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
        view.backgroundColor = .blue
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        label.text = "Hallo Macoun!"
        return label
    }()
    
    fileprivate(set) lazy var barButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(BadViewController.exerciseAmbiguity(_:)))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.rightBarButtonItem = barButtonItem
        
        let views = ["view": emptyView, "label": textLabel]
        views.values.forEach(view.addSubview)
        
        let constraints = [
            "H:|-[view]-|",
            "H:|-(>=8)-[label]-(>=8)-|",
            "V:|-(84)-[view]-[label]-(>=20)-|"
            ].constraints(with: views) + [
                textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        constraints.activate()
    }
    
    @IBAction func exerciseAmbiguity(_ sender: AnyObject?) {
        if emptyView.hasAmbiguousLayout {
            print("EmptyView has ambiguous layout")
            emptyView.exerciseAmbiguityInLayout()
        } else {
            print("EmptyView has *no* ambiguous layout")
        }
    }
}
