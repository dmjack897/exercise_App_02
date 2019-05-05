//
//  ViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/16.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import Firebase    //서버 구축을 위한 firebase를 사용하기 위해 선언
import GoogleSignIn     //Google 아이디를 사용하기 위해 선언

class ViewController: UIViewController,GIDSignInUIDelegate {
    //var box = UIImageView()
    
    @IBOutlet weak var loginButton: UIButton!   //로그인 버튼 선언
    @IBOutlet weak var signupButton: UIButton!  //회원가입 버튼 선언
    @IBOutlet weak var email: UITextField!  //이메일 입력을 위해 textfield 선언
    @IBOutlet weak var password: UITextField!   //비밀번호 입력을 위해 testfield 선언
    
    @IBAction func signin(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn() //로그인을 수행하는 함수
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        try! Auth.auth().signOut()
        // Do any additional setup after loading the view.
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
      //  GIDSignIn.sharedInstance().signIn()   //ログインする部分
        
      //  self.view.addSubview(box)
      //  self.displayWelcome()
        loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(presentString), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener{ (auth, user)
            in
            if(user != nil){    //로그인시 필요한 조건들이 수행되면 다음 페이지로 넘어가기 위한 부분
                let view = self.storyboard?.instantiateViewController(withIdentifier: "MainViewTabBarController") as!
                UITabBarController
                self.present(view, animated: true,completion: nil)
            }
        }
    }

    func displayWelcome()
    {
       // let loginVC = self.storyboard?.instantiateInitialViewController(withIdentifier: "")
        signupButton.addTarget(self,action: #selector(presentString), for: .touchUpInside)
    }
    
    @objc func presentString()
    {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.present(view, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func loginEvent() //로그인이벤트를 수행하는 함수 선언
    {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, err) in
            
            if(err != nil)  //이메일 비밀번호가 일치하지 않을경우 에러 발생
            {
                let alret = UIAlertController(title: "エラー", message: err.debugDescription, preferredStyle: UIAlertController.Style.alert)
                alret.addAction(UIAlertAction(title: "戻る", style: UIAlertAction.Style.default, handler: nil))
                self.present(alret,animated: true,completion: nil)
            }
        }
    }
    
}




