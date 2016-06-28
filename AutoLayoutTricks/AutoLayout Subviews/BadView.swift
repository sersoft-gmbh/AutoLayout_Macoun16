//
//  BadView.swift
//  AutoLayoutTricks
//
//  Created by Florian Friedrich on 28/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFFoundation

class BadView: UIView {
    let textLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        label.text = "Hallo Macoun!"
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        preinitialize()
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func preinitialize() {
        
    }
    
    private final func initialize() {
        addSubview(textLabel)
        let constraints = [
            "H:|-[label]-|",
            "V:|-[label]-|"
            ].constraintsWithViews(["label": textLabel])
        constraints.activate()
        layoutIfNeeded()
    }
}
