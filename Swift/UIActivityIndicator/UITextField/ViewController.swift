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
    //Activity Indicator kısmına ait kodlardır.
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var labelWarns: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton){
        //swiftte çoklu koşulları , ile girebiliyoruz
        if usernameTextField.text == "adem", passwordTextField.isHidden{
            labelWarns.isHidden = true
            passwordTextField.isHidden = false
            activityIndicatorView.isHidden = true
        }
        else if usernameTextField.text == "adem", passwordTextField.text == "12345" {
            labelWarns.isHidden = true
            activityIndicatorView.isHidden = false
            activityIndicatorView.startAnimating()
        }
        else{
            if usernameTextField.text != "adem"{
                activityIndicatorView.isHidden = true
                labelWarns.text = "Kullanıcı adınız hatalı"
                labelWarns.isHidden = false
            }
            else if passwordTextField.text != "12345"{
                activityIndicatorView.isHidden = true
                labelWarns.text = "Şifreniz hatalı"
                labelWarns.isHidden = false
            }

        }
        
        //*************patikaDev başlangıç*****************************
        //de hocanın yazdığı kod kısmı daha temiz görünmekte aşağıya ekliyorum
        
//        if usernameTextField.text == "adem", passwordTextField.isHidden{
//            passwordTextField.isHidden = false
//            labelWarns.isHidden = true
//
//        }
//        else{
//            if usernameTextField.text != "adem"{
//                labelWarns.text = "Kullanıcı adı yanlış"
//                labelWarns.isHidden = false
//            }
//            else if !(passwordTextField.isHidden), passwordTextField.text == "12345" {
//                activityIndicatorView.startAnimating()
//                labelWarns.isHidden = true
//            }
//            else{
//                labelWarns.text = "Şifreniz yanlış"
//                labelWarns.isHidden = false
//            }
//        }
        
        
        
        //*************patikaDev kodu bitiş************************
        
        
    }
    
}

