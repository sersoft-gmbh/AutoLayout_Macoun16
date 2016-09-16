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
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .center
        view.distribution = .equalCentering
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.enableAutoLayout()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 25
        return view
    }()
    
    fileprivate(set) lazy var bottomView: UIButton = {
        let button = UIButton(type: .system)
        button.enableAutoLayout()
        button.addTarget(self, action: #selector(BadViewController.toggleTopView(_:)), for: .touchUpInside)
        button.setTitle("Mal da, mal weg", for: UIControlState())
        return button
    }()
    
    fileprivate var topViewWidthConstraint: NSLayoutConstraint!
    fileprivate var topViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(stackView)
        
        topViewWidthConstraint = createTopViewWidthConstraint()
        topViewHeightConstraint = createTopViewHeightConstraint()
        
        let constraints = [
            "H:|-(>=0)-[stackView]-(>=0)-|",
            "V:|-(>=0)-[stackView]-(>=0)-|",
            ].constraints(with: ["stackView": stackView]) + [
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                topViewWidthConstraint,
                topViewHeightConstraint
        ]
        
        constraints.activate()
        
        [topView, bottomView].forEach(stackView.addArrangedSubview)
    }
    
    func createTopViewWidthConstraint() -> NSLayoutConstraint {
        return topView.widthAnchor.constraint(equalToConstant: 50)
    }
    
    func createTopViewHeightConstraint() -> NSLayoutConstraint {
        return topView.heightAnchor.constraint(equalToConstant: 50)
    }
    
    @IBAction func toggleTopView(_ sender: AnyObject?) {
        UIView.animate(withDuration: 0.3, animations: {
            // Force layout cycle
            self.topViewHeightConstraint.isActive.toggle()
            // Adds a 0-Height constraint (created by UIStackView)
            self.topView.isHidden.toggle()
        }) 
    }
}
