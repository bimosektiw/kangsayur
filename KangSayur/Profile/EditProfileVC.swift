//
//  EditProfileVC.swift
//  KangSayur
//
//  Created by Jordan Andra Kurniawan on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

protocol CanReceive {
    func passDataBack(name: String, address: String, phone: String, email: String, password: String)
}

class EditProfileVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var addPhotoBtn: UIButton!
    
    var imagePicker = UIImagePickerController()
    var delegate:CanReceive?
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageField.layer.cornerRadius = 64
        hideKeyboardWhenTappedAround()
        
        imagePicker.delegate = self
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(title: "Message", message: "Please fill all the information!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        nameField.text = ""
        addressField.text = ""
        phoneField.text = ""
        emailField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        if nameField.text == "" || addressField.text == "" || phoneField.text == "" || emailField.text == "" || passwordField.text == "" {
            showErrorAlert()
        }else{
            delegate?.passDataBack(name: nameField.text!, address: addressField.text!, phone: phoneField.text!, email: emailField.text!, password: passwordField.text!)
            dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
        
    @IBAction func addPhotoClicked(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            guard let pickedImage = info[.originalImage] as? UIImage else{
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            
            imageField.contentMode = .scaleAspectFit
            imageField.image = pickedImage
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    extension UIViewController {
        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    }
