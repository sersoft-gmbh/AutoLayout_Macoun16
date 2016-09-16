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
    let firstLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        label.text = "Label 1: Mehr Text für die Macoun!"
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        label.text = "Label 2: Leider geht's damit kaputt!"
        return label
    }()
    
    fileprivate(set) lazy var barButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(BadViewController.exerciseAmbiguity(_:)))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.rightBarButtonItem = barButtonItem
        
        let views = ["first": firstLabel, "second": secondLabel]
        views.values.forEach(view.addSubview)
        
        let constraints = [
            "H:|-[first]-(>=8)-[second]-|",
            "V:|-(84)-[first]-(>=20)-|",
            "V:|-(84)-[second]-(>=20)-|"
            ].constraints(with: views)
        
        constraints.activate()
    }
    
    @IBAction func exerciseAmbiguity(_ sender: AnyObject?) {
        if firstLabel.hasAmbiguousLayout {
            print("FirstLabel has ambiguous layout")
            firstLabel.exerciseAmbiguityInLayout()
        } else if secondLabel.hasAmbiguousLayout {
            print("SecondLabel has ambiguous layout")
            secondLabel.exerciseAmbiguityInLayout()
        } else {
            print("Labels have *no* ambiguous layout")
        }
    }
}
