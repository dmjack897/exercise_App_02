//
//  ChestViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/23.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import AVKit  //動画再生の為ヘーダファイル

class ChestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnFirstMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://youtu.be/o6jUa3sQQFw")!
        
        playVideo(url: url)
    }
    @IBAction func btnSecondMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://youtu.be/o6jUa3sQQFw")!
        
        playVideo(url: url)
    }
    
    @IBAction func btnThirdMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://youtu.be/o6jUa3sQQFw")!
        
        playVideo(url: url)
    }
    @IBAction func btnForthMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://youtu.be/o6jUa3sQQFw")!
        
        playVideo(url: url)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func playVideo(url: NSURL)   //共通的に必要な部分を別に宣言する部分
    {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true)
        {
            player.play()
        }
    }
}
