//
//  Image.swift
//  FoodSideUi
//
//  Created by Jeremy Kearse on 9/14/19.
//  Copyright © 2019 Jeremy Kearse. All rights reserved.
//

import Foundation
import UIKit

// Struct
class Image
{
    var image: UIImage
    var title: String
    var price: Double
    
    init(image: UIImage, title: String, price: Double)
    {
        self.image = image
        self.title = title
        self.price = price
    }
}
