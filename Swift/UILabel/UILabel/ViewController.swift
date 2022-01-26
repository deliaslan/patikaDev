//
//  ViewController.swift
//  UILabel
//
//  Created by Adem Deliaslan on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "Merhaba IOS"
        label.font = UIFont.systemFont(ofSize: 25.0)
        label.textColor = UIColor.red
    }


}

