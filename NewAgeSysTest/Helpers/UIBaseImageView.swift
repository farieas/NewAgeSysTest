//
//  UIBaseImageView.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 10/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import UIKit


protocol ViewProperties {
    var roundedCorner : Bool { get set }
}

class BaseImageView : UIImageView,ViewProperties {
    
    @IBInspectable
    var roundedCorner: Bool {
        get {
            return self.layer.cornerRadius == self.bounds.width/2
        } set {
            DispatchQueue.main.async {
                self.layer.cornerRadius = self.bounds.width/2
                self.layoutIfNeeded()
            }
        }
    }
    
}

