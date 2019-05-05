//
//  ThirdViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/24.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import RealmSwift

class Cart :Object{
    @objc dynamic var name = ""
    
}

class ThirdViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var textfield: UITextField!
    @IBAction func button(_ sender: Any) {
        
        let cart = Cart()
        cart.name = textfield.text!
        try! realm?.write {
            realm?.add(cart)
 
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    var notificationToken : NotificationToken?
    var realm:Realm?
    var items:Results<Cart>?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = items![indexPath.row].name
        return cell
    }
    //////////////.  delete부분
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let cart = items![indexPath.row]
            try! self.realm?.write {
                self.realm?.delete(cart)
            }
        }
    }
    ///////////////
       override func viewDidLoad() {
        super.viewDidLoad()
        let config = Realm.Configuration( deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
        
        items = realm?.objects(Cart.self)
        
            notificationToken = realm?.observe({ (noti, realm) in
                self.tableview.reloadData()
            })
        // Do any additional setup after loading the view.
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


