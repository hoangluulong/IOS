//
//  ViewController.swift
//  FoodManagement
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //Mart: Properties

    @IBOutlet weak var edtMealName: UITextField!
    
   
 
    @IBOutlet weak var ImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edtMealName.delegate = self
       
    }
    
    //Mart: TextView's Delegation Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let mealName = textField.text{
            print("Meal name is:\(mealName)")
        }
    }
    
    //Mart: Image Properties
    
    @IBAction func imageProperting(_ sender: UITapGestureRecognizer) {
        //hide the keyboard
        edtMealName.resignFirstResponder()
        //Get image from photo libary
        let imagePicker = UIImagePickerController()
        //Config the image's scurce
        imagePicker.sourceType = .photoLibrary
        //delegetImage
        imagePicker.delegate = self
        //show the imagepicker
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
             ImageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
}

