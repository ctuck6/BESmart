//
//  ItemCell.swift
//  FoodSideUi
//
//  Created by Jeremy Kearse on 9/14/19.
//  Copyright © 2019 Jeremy Kearse. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

   

    @IBOutlet weak var ItemImageView: UIImageView?
    @IBOutlet weak var ItemTitleLabel: UILabel?
    @IBOutlet weak var ItemPriceLabel: UILabel?
    
    func setImage(image: Image)
    {
        //ItemImageView = image.image
    
        
        ItemImageView?.image =  image.image
        ItemTitleLabel?.text = image.title
        ItemPriceLabel?.text = image.title
    }
}
