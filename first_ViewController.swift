//
//  first_ViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/26.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import AVKit

class first_ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var table = [Videos]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("videos")
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let Object = video.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let videolink = Object?["link"]
                    
                    let video = Videos(Title: Title as! String, link: videolink as! String)
                    self.table.append(video)
                    
                    self.Tableview.reloadData()
                }
            }
            
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let video: Videos
        
        video = table[indexPath.row]
        cell.titleLabel.text = video.Title
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: table[indexPath.row].link!) else {
            return
        }
        let player = AVPlayer(url: videoURL)
        
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true)
        {
            player.play()
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

}
