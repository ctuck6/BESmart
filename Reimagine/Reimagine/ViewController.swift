//
//  ViewController.swift
//  Reimagine
//
//  Created by Cameron Tuckear on 9/14/19.
//  Copyright © 2019 Cameron Tucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var itemImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let flights = try? HttpRequester.init().makeGETHTTPRequest(urlString: "https://flight-engine-behack2019.herokuapp.com/flights?date=2019-09-06&origin=lax&destination=dfw") else {
            return
        }
        //print resposnse and handle response
        print(flights[0].flightNumber)
        
        //create and present alert
        let alertController = getAlert(type: getItemType(type: "bottle"))
        present(alertController, animated: true)
    }
    
    @IBAction func takePhotoButton(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        //create action sheet
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        //create camera button
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else{
                print("Camera is not available")
                let alert = UIAlertController(title: "Camera Alert", message: "Camera not available on this platform", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }))
        
        //create photo library button
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        //create cancel button
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //present action sheet
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        itemImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getItemType(type: String) -> ItemType{
        if (type == "bottle" || type == "toothpaste" || type == "water") {
            return .liquidItem
        } else if (type == "food" || type == "fruit") {
            return .foodItem
        }  else if (type == "knife" || type == "gun") {
            return .dangerousItem
        } else {
            return .validItem
        }
    }
    
    // get Alert based on type
    func getAlert(type: ItemType) -> UIAlertController {
        switch type {
        case .liquidItem:
            let title = "Liquid Item Detected"
            let message = "Liquids over 3.4 ounces (100ml) are prohibited in carry on baggage"
            return createAlert(title: title, message: message)
        case .foodItem:
            let title = "Food Item Detected"
            let message = "Food Items will be asked to be placed outside of carry-on luggage when going through security"
            return createAlert(title: title, message: message)
        case .dangerousItem:
            let title = "Dangerous Item Detected"
            let message = "Sharp objects, Guns, Self-Defense Items(pepper spray), tools are prohibited in carry-on luggage"
            return createAlert(title: title, message: message)
        case .validItem:
            return createAlert(title: "Valid Item", message: "Your good to go!")
        default:
            return createAlert(title: "Valid Item", message: "Your good to go!")
        }
    }
    
    // create general alert
    func createAlert(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        return alertController
    }
}

