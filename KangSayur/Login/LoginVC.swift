//
//  Login.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit
import CoreData

class LoginVC: BaseVC, UIScrollViewDelegate, UITextFieldDelegate {
    
   
    var people:[NSManagedObject] = []
    @IBOutlet var ScrollView: UIScrollView! //set ScrollView buat onboarding
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var LoginRegisterCardView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var onboardingTitleLabel: UILabel!
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var RegisterButton: UIButton!
    
    
    var scrollWidth: CGFloat! = 0 //setwidth scrollview
    var scrollHeight: CGFloat! = 0 //setheight scrollview
    var pageCount:Int = 0
    
    var boardingImages = ["onboarding-1","onboarding-2","onboarding-3"]//image from assets
    
    override func viewDidLayoutSubviews() { //override buat layout subview
        scrollWidth = ScrollView.frame.size.width
        scrollHeight = ScrollView.frame.size.height
    }
    
    func setupLoginRegisterCardView(){
        LoginRegisterCardView.layer.cornerRadius = 15
    }
    
    func setupLoginButton(){
        LoginButton.backgroundColor = UIColor(red: 0.34, green: 0.67, blue: 0.32, alpha: 1.00)
        LoginButton.setTitleColor(.white, for: .normal)
        LoginButton.titleLabel!.font = UIFont(name: "SF Pro Text-Bold" , size: 25)
    }
    
    func setupRegisterButton(){
        RegisterButton.backgroundColor = UIColor(red: 0.05, green: 0.10, blue: 0.07, alpha: 1.00)
        RegisterButton.setTitleColor(.white, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
       
    
    override func viewDidLoad() {
     
  
        
        
        //setting keyboard
        self.usernameTextField.delegate = self //usernameTextField
        self.passwordTextField.delegate = self //passwordTexField
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //keyboard masuk, layout naik turun
        
        setupLoginRegisterCardView()
        setupRegisterButton()
        setupLoginButton()
        
        super.viewDidLoad()
        
        self.view.layoutIfNeeded() //nge aktifin settingan size
        self.ScrollView.delegate = self
        ScrollView.isPagingEnabled = true //setting pagecontrol
        ScrollView.showsVerticalScrollIndicator = false //setting pagecontrol
        ScrollView.showsHorizontalScrollIndicator = false //setting pagecontrol
        
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0) //sizeFrame ngikutin layar
        
        for index in 0..<boardingImages.count { //looping dari total onboardingpages
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame) // subview
            
            let imageView = UIImageView.init(image: UIImage.init(named: boardingImages[index])) //set image yang di looping
            imageView.frame = ScrollView.frame
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x: scrollWidth/2, y: scrollHeight/2) //cari titik tengahnya programmmatically
            
            slide.addSubview(imageView) //add subview dari image yang udah diset
            ScrollView.addSubview(slide) // set slide yang udah diisi kedalam scroll view
        }
        
        ScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(boardingImages.count), height: scrollHeight) //lebar ny total dari jumlah gambar dan tinggi sesuai gambar
        
        self.ScrollView.contentSize.height = 1.0
        PageControl.numberOfPages = boardingImages.count
        PageControl.currentPage = 0
    }
    
    //set login button pressed
    @IBAction func Login(_ sender: Any) {
        print("login pressed")
        if usernameTextField.text == ""{
            //alert if empty or missed matched value
            let alert = UIAlertController(title: "Login failed", message: "Email/Password cannot be empty", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        } else {
            
            //fetching user data from coreData
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
            fetchRequest.predicate = NSPredicate(format: "email = %@", "" + usernameTextField.text!)
            
            do {
                let result = try managedContext.fetch(fetchRequest)
                if result.count > 0 {
                    let inputPassword = passwordTextField.text
                    let passwordFromData = result[0].value(forKey: "password") as! String
                    
                    if inputPassword == passwordFromData {
                        print("login success")
                        performSegue(withIdentifier: "toHomePage", sender: nil)
                    }else{
                        let alert = UIAlertController(title: "Login failed", message: "Wrong email/password", preferredStyle:.alert)
                        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                }else{
                      let alert = UIAlertController(title: "Login failed", message: "Wrong email/password", preferredStyle:.alert)
                      alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
                      self.present(alert, animated: true)
                }
            } catch let error as NSError {
                print ("Could not fetch. \(error)")
            }
        }
    }
    
    //set keyboard
    @objc func keyboardWillShow(notification: NSNotification) { //fungsi buat edit keyboard
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    //set keyboard
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //set indikator
    @IBAction func pageChanged(_ sender: Any) {
        ScrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((PageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
     }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           setIndicatorForCurrentPage()
       }

    func setIndicatorForCurrentPage()  {
        let page = (ScrollView?.contentOffset.x)!/scrollWidth
        PageControl?.currentPage = Int(page)
//        changeTitle()
         
               if page == 0 {
                    onboardingTitleLabel.text = "Pengalaman Baru Berbelanja Di Tukang Sayur"
                } else if page == 1{
                     onboardingTitleLabel.text = "Pesan Dari Tukang Sayur Langgananmu"
                } else {
                    onboardingTitleLabel.text = "Bantu Tukang Sayur Sekitar"
                }
    }
   
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.ScrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        self.ScrollView.scrollRectToVisible(frame, animated: animated)
   }
}

//indicator
 
