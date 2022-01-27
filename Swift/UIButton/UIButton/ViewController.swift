//
//  ViewController.swift
//  UIButton
//
//  Created by Adem Deliaslan on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    //action gönderen nesnenin ne türde olduğu bilinmediği durumlarda
    // ya da aynı action fonksiyonunun birden çok tetiklemede kullanıldığı
    // durumlarda sender Any olarak kalmaktadır
  
//    @IBAction func didTapButton(_ sender: Any) {
//        label.text = "Hoşgeldiniz!"
//    }
    
    //Eeğer gönderdiğimiz nesnenin ne türde olduğunu biliyorsak o zaman
    // o değeri veriyoruz
    
        @IBAction func didTapButton(_ sender: UIButton) {
            sender.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            label.text = "Hoşgeldiniz!"
        }
}

