//
//  ViewController.swift
//  ListApp
//
//  Created by Adem Deliaslan on 28.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var alertController = UIAlertController()
    
    var data = [String]()
    
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
    
    
    @IBAction func didAddButtonItemTapped(_ sender: UIBarButtonItem){
        presentAddAlert()
    }
    
    @IBAction func didRemoveButtonItemTapped(_ sender: UIBarButtonItem){
        
        presentAlert(title: "Uyarı!",
                     message: "Listedeki tüm elemanları silmek istediğinize emin misiniz?",
                     defaultButtonTitle: "Evet",
                     cancelButtonTitle: "Vazgeç"
        ) { _ in
            self.data.removeAll()
            self.tableView.reloadData()
            
        }
        
        
    }
    
    func presentAddAlert(){
        
        
        presentAlert(title: "Yeni Eleman Ekle", message: nil, prefferedStyle: .alert, defaultButtonTitle: "Ekle", cancelButtonTitle: "Vazgeç", isTextFieldAvaliable: true, defaultButtonHandler: { _ in
            let inputText = self.alertController.textFields?.first?.text
            
            if inputText != "" {
                self.data.append((inputText)!)
                //aşağıdaki kod ile datayı yeniliyoruz ekranda
                self.tableView.reloadData()
                
            }
            else
            {
                self.presentWarningAlert()
            }
            
        })
        
    }
    
    func presentWarningAlert(){
        
        
        presentAlert(title: "Uyarı!",
                     message: "Liste elemanı boş olamaz.",
                     prefferedStyle: .alert,
                     cancelButtonTitle: "Vazgeç")
    }
    
    func presentAlert(title: String?,
                      message: String?,
                      prefferedStyle: UIAlertController.Style = .alert,
                      defaultButtonTitle: String? = nil,
                      cancelButtonTitle: String?,
                      isTextFieldAvaliable: Bool = false,
                      defaultButtonHandler: ((UIAlertAction) -> Void)? = nil
    ){
        
        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: prefferedStyle)
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle,
                                              style: .default,
                                              handler: defaultButtonHandler)
            alertController.addAction(defaultButton)
        }
        
        if isTextFieldAvaliable{
            alertController.addTextField()
        }
        
        //cancelda stil .cancel seçilecek
        let cancelButton = UIAlertAction(title: cancelButtonTitle,
                                         style: .cancel,
                                         handler: nil)
        
        
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true)
    }
}

