//
//  ViewController.swift
//  ListApp
//
//  Created by Adem Deliaslan on 28.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["Swift", "Kotlin", "C++", "C", "Pytohn", "Java", "C#"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //datasource için datayı çevirecek 2 metodu eklememiz gerekiyor.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }


}

