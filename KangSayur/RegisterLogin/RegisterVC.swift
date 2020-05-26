//
//  RegisterVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit
import CoreData


class RegisterVC: BaseVC, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @IBOutlet var imageView: UIImageView!
        @IBOutlet var chooseButton: UIButton!
        @IBOutlet weak var namaTxt: UITextField!
        @IBOutlet weak var alamatTxt: UITextField!
        @IBOutlet weak var teleponTxt: UITextField!
        @IBOutlet weak var emailTxt: UITextField!
        @IBOutlet weak var passwordTxt: UITextField!
    
        var imagePicker = UIImagePickerController()
        var people: [NSManagedObject] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            passwordTxt.isSecureTextEntry = true
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
        
        func showErrorAlert(){
            let alert = UIAlertController(title: "Message", message: "Please fill all the information!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            namaTxt.text = ""
            alamatTxt.text = ""
            teleponTxt.text = ""
            emailTxt.text = ""
            passwordTxt.text = ""
        }
    
    func save(name: String, address:String, phone:String, email:String, pass:String) {
          
          guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          
          // 1
          let managedContext = appDelegate.persistentContainer.viewContext
          
          // 2
          let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!

          let person = NSManagedObject(entity: entity, insertInto: managedContext)
          
          // 3
          person.setValue(name, forKeyPath: "name")
          person.setValue(address, forKeyPath: "address")
          person.setValue(phone, forKeyPath: "phone")
          person.setValue(email, forKeyPath: "email")
          person.setValue(pass, forKeyPath: "password")

          
          // 4
          do {
            try managedContext.save()
            people.append(person)
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
          }
    
        @IBAction func submitBtn(_ sender: Any) {
            if namaTxt.text == "" || alamatTxt.text == "" || teleponTxt.text == "" || emailTxt.text == "" || passwordTxt.text == "" {
                showErrorAlert()
            }else{
                
                
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
             
                let managedContext = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
                fetchRequest.predicate = NSPredicate(format: "email = %@", "" + emailTxt.text!)
                
                do {
                    let result = try managedContext.fetch(fetchRequest)
                    if result.count > 0 {
                            let alert = UIAlertController(title: "Register failed", message: "Email already taken", preferredStyle:.alert)
                            alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
                            self.present(alert, animated: true)
                    }else{
                        guard let name = namaTxt.text else { return }
                        guard let address = alamatTxt.text else { return }
                        guard let phone = teleponTxt.text else { return }
                        guard let email = emailTxt.text else { return }
                        guard let pass = passwordTxt.text else { return }
                        self.save(name: name, address: address, phone: phone, email: email, pass: pass)
                        print("all saved")
                       
                       if let imageData = imageView.image?.pngData() {
                           DataBaseHelper.shareInstance.saveImage(data: imageData)
                       }
                       
                    }
                } catch let error as NSError {
                    print ("Could not fetch. \(error)")
                }
             
                
               
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
//           self.layer.borderColor = UIColor.black.cgColor
           self.layer.cornerRadius = self.frame.height / 2
           self.clipsToBounds = true
           self.contentMode = .scaleAspectFill
       }
   }

class DataBaseHelper {
    
    static let shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImage(data: Data) {
        
        let imageInstance = Person(context: context)
        imageInstance.img = data
        
        do {
            try context.save()
                print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
   }
}
