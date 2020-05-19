//
//  Register.swift
//  KangSayur
//
//  Created by Venus Dhammiko on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class Register: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @IBOutlet var imageView: UIImageView!
        @IBOutlet var chooseButton: UIButton!
        var imagePicker = UIImagePickerController()

        override func viewDidLoad() {
            super.viewDidLoad()
            hideKeyboardWhenTappedAround()
            
            imagePicker.delegate = self
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        
        @IBAction func btnClicked() {
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
            
            imageView.round()
            imageView.image = pickedImage
            
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

extension UIImageView {
    func round() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        
    }
}

