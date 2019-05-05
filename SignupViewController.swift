//
//  SignupViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/16.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var cancle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signup.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
        cancle.addTarget(self, action: #selector(cancelevent), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func signupEvent()
    {
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, err) in
        //  let uid = user?.uid
            
          //  Database.database().reference().child("users").child(user!).setvalue(["name":name.text!])
           
        }
        
    }
    @objc func cancelevent()
    {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
