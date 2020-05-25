//
//  EditProfileVC.swift
//  KangSayur
//
//  Created by Jordan Andra Kurniawan on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var addPhotoBtn: UIButton!
    var imagePicker = UIImagePickerController()
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let userName = "username"
        static let userAddress = "address"
        static let userPhone = "phone"
        static let userEmail = "email"
        static let userPassword = "password"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationLabel.isHidden = true
        hideKeyboardWhenTappedAround()
        
        imagePicker.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setProfileImage() {
        imageField.layer.cornerRadius = imageField.frame.size.height / 2
        imageField.clipsToBounds = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
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
