//
//  InitialTableViewController.swift
//  UITableViewExample
//
//  Created by Adem Deliaslan on 27.01.2022.
//

import UIKit

class InitialTableViewController: UITableViewController {
    
    //Örnek dataseti oluşturduk *********
    var tableViewData = [["General","Accessibility","Privacy"], ["Passwords"], ["Safari","News"], ["Developer"]]
    //***********************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewData[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.section][indexPath.row]
        // Configure the cell...
        
        return cell
    }
    //******************************************BU  DERSE AİT İÇERİK KISMI AŞAĞIDAKİ BÖLÜMDÜR************************
    //UIAlertController kullanımına ait olan kod kısmı
    // didSelectRowAt dediğimizde tanımlanmış hazır fonksiyon direkt oluşturulabilmektedir.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //alert içerisinde yazacak olan başlık ve içerik burada değişken olarak tanımlanıyor.
        let alertController = UIAlertController(title: "UYARI", message: tableViewData[indexPath.section][indexPath.row], preferredStyle: .alert)
        
        //alert uyarısını kapatmak için TAMAM ifadesi yazıp gerekli bilgileri düzenliyoruz. completion kısmı gerekli değil burada silinse dahi çalışır.
        alertController.addAction(UIAlertAction(title: "TAMAM",
                                                style: UIAlertAction.Style.default,
                                                handler: {
            _ in alertController.dismiss(animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "SİL", style: UIAlertAction.Style.default, handler: {
            _ in self.tableViewData[indexPath.section].remove(at: indexPath.row)
            //silinen verilerin görntüye yansıması için kullandığımız komut
            tableView.reloadData()
        }))
        present(alertController, animated: true, completion: nil)
    }
    //******************************************BU  DERSE AİT İÇERİK KISMI YUKARIDAKİ BÖLÜMDÜR ************************
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
