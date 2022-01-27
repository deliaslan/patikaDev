//
//  ViewController.swift
//  UITextField
//
//  Created by Adem Deliaslan on 27.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapLoginButton(_ sender: UIButton){
//        print("Username: \(usernameTextField.text)")
//        print("Password: \(passwordTextField.text)")
        
        //yukrıdaki tanımlamalarda optional olarak verileri ekrana yazmaktadır.
        // biz bu durumdan kurtulmak için describe özelliğini kullanıyoruz.
        //ya da yine optional ama boş olduğunda istediğimiz değeri
        //ekrana basacaktır.
        print("Username: \(String(describing: usernameTextField.text))")
        
        print("Password: \(passwordTextField.text ?? "Şifre girilmedi")")
        
    }
    
}

