//
//  RegisterVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit


class RegisterVC: BaseVC, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @IBOutlet var imageView: UIImageView!
        @IBOutlet var chooseButton: UIButton!
        var imagePicker = UIImagePickerController()

        override func viewDidLoad() {
            super.viewDidLoad()
            
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
            
            imageView.Round()
            imageView.image = pickedImage
            
            dismiss(animated: true, completion: nil)
        }
        
}

extension UIImageView {
       func Round() {

           self.layer.borderWidth = 1
           self.layer.masksToBounds = false
           self.layer.borderColor = UIColor.black.cgColor
           self.layer.cornerRadius = self.frame.height / 2
           self.clipsToBounds = true
           self.contentMode = .scaleAspectFill
       }
   }
