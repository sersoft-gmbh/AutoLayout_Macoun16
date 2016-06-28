//
//  GoodView.swift
//  AutoLayoutTricks
//
//  Created by Florian Friedrich on 28/06/16.
//  Copyright © 2016 ser.soft GmbH. All rights reserved.
//

import UIKit
import FFUIKit

class GoodView: BadView {
    override func preinitialize() {
        super.preinitialize()
        // Fix it
        enableAutoLayout()
    }
}
