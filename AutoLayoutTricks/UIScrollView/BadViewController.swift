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

func *(lhs: String, rhs: Int) -> String {
    return (1..<rhs).reduce(lhs) { $0.0 + " " + lhs }
}

class BadViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.enableAutoLayout()
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.enableAutoLayout()
        return view
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.text = "Die Macoun macht allen Spass!" * 15
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.setupFullscreen(in: view)
        contentView.setupFullscreen(in: scrollView)
        textLabel.setupFullscreen(in: contentView)
    }
}
