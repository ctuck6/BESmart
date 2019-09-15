//
//  FoodListScreenViewController.swift
//  FoodSideUi
//
//  Created by Jeremy Kearse on 9/14/19.
//  Copyright © 2019 Jeremy Kearse. All rights reserved.
//

import UIKit

class FoodListScreenViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var images: [Image] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        images = createArray()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func createArray() -> [Image]
    {
        var tempItems: [Image] = []
        
        // Optionals Optional Int - int?
        guard
            let image1 = UIImage(named: "Checkers"),
            let image2 = UIImage(named: "WhiteCastle"),
            let image3 = UIImage(named: "BurgerKing"),
            let image4 = UIImage(named: "Lime")
            else {
            return []
        }
        
        tempItems.append(Image(image: image1, title: "Checkers"))
        tempItems.append(Image(image: image2, title: "WhiteCastle"))
        tempItems.append(Image(image: image3, title: "BurgerKing"))
        tempItems.append(Image(image: image4, title: "Lime"))
        
        return tempItems
    }

}
extension FoodListScreenViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell")as! ItemCell
        
        cell.setImage(image: image)
        
        return cell
    }
}
