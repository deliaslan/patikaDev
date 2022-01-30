//
//  ViewController.swift
//  ListApp
//
//  Created by Adem Deliaslan on 28.01.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var alertController = UIAlertController()
    
    
    var data = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.fetch(entity: "ListItem")
        
        
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    //datasource için datayı çevirecek 2 metodu eklememiz gerekiyor.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(
            withIdentifier: "defaultCell",
            for: indexPath)
        
        let listItem = data[indexPath.row]
        //core datadaki verimizin hangi tipte olduğunu belirtiyoruz
        cell.textLabel?.text = listItem.value(forKey: "title") as? String //cast işlemi
        return cell
    }
    
    //listeden tekli eleman silme sağdan sola kaydırarak(trailing)
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Sil"){
            _, _, _ in
            //  self.data.remove(at: indexPath.row)
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let managedObjectContext = appDelegate?.persistentContainer.viewContext
            managedObjectContext?.delete(self.data[indexPath.row])
            
            try? managedObjectContext?.save()
            
            self.fetch(entity: "ListItem")
            
        }
        
        deleteAction.backgroundColor = .systemRed
        
        
        let editAction = UIContextualAction(style: .normal, title: "Düzenle"){
            _, _, _ in
            
            
            self.presentAlert(title: "Elemanı Düzenle",
                              message: nil,
                              prefferedStyle: .alert,
                              defaultButtonTitle: "Düzenle",
                              cancelButtonTitle: "Vazgeç",
                              isTextFieldAvaliable: true,
                              defaultButtonHandler: { _ in
                let inputText = self.alertController.textFields?.first?.text
                
                if inputText != "" {
                    //   self.data[indexPath.row] = inputText!
                    
                    let appDelegate = UIApplication.shared.delegate as? AppDelegate
                    let managedObjectContext = appDelegate?.persistentContainer.viewContext
                    
                    self.data[indexPath.row].setValue(inputText, forKey: "title")
                    
                    if managedObjectContext?.hasChanges == true{
                        try? managedObjectContext?.save()
                    }
                    
                    //edit işleminde tkerar veritabanından
                    self.tableView.reloadData()
                }
                else
                {
                    self.presentWarningAlert()
                }
                
            })
        }
        
        editAction.backgroundColor = .systemMint
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        
        return config
    }
    @IBAction func didAddButtonItemTapped(_ sender: UIBarButtonItem){
        presentAddAlert()
    }
    
    //leftBarButtonItem remove all
    @IBAction func didRemoveButtonItemTapped(_ sender: UIBarButtonItem){
        
        presentAlert(title: "Uyarı!",
                     message: "Tüm elemanları listeden silmek istediğinize emin misiniz?",
                     defaultButtonTitle: "Tümünü Sil",
                     cancelButtonTitle: "Vazgeç"
        ){ _ in
            
            //Tüm elemanları sileceğimiz fonksiyon
            self.deleteAllData(entity: "ListItem")
            
        }
    }
    
    func presentAddAlert(){
        
        presentAlert(title: "Yeni Eleman Ekle",
                     message: nil,
                     prefferedStyle: .alert,
                     defaultButtonTitle: "Ekle",
                     cancelButtonTitle: "Vazgeç",
                     isTextFieldAvaliable: true,
                     defaultButtonHandler: { _ in
            let inputText = self.alertController.textFields?.first?.text
            
            if inputText != "" {
                //  self.data.append((inputText)!)
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                let managedObjectContext = appDelegate?.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "ListItem",
                                                        in: managedObjectContext!)
                let listItem = NSManagedObject(entity: entity!,
                                               insertInto: managedObjectContext)
                
                listItem.setValue(inputText,
                                  forKey: "title")
                //veritabanına kaydetme
                try? managedObjectContext?.save()
                
                //aşağıdaki kod ile datayı yeniliyoruz ekranda
                self.fetch(entity: "ListItem")
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
    
    func fetch(entity: String) {
        //Veritabanındaki  bilginin ekrana gelmesi için veriyi çekme işlemi
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedObjectContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>.init(entityName: entity)
        
        data =  try! managedObjectContext!.fetch(fetchRequest)
        
        tableView.reloadData()
    }
    
    func deleteAllData(entity: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedObjectContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject
                managedObjectContext.delete(managedObjectData)
                print("Deleted")
            }
            
        } catch let error as NSError {
            print(error)
        }
        
        try? managedObjectContext.save()
        self.fetch(entity: "ListItem")
        
    }
    
}







