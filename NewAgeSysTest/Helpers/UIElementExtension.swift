//
//  UIElementExtension.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 10/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// Fetch Image from URL string Using Kingfisher
    /// - Parameter image: pass image url string
    func setImage(image:String?) {
        self.kf.setImage(with: URL(string: image ?? ""),placeholder: UIImage(systemName: "timelapse"))
    }
    
    
}
