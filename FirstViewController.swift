//
//  FirstViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/04/16.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import FirebaseDatabase


class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let picture: pictures
        
        picture = table[indexPath.row]
        cell.y6u78leLabel.text = picture.Title
        
        return cell
    }
    */
    var table = [pictures]()
    var ref: DatabaseReference!
    
    
    
    @IBOutlet weak var Tableview: UITableView!
    /*
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var images = ["1番画面の01.jpg", "1番画面の02.jpg", "1番画面の03.jpg", "1番画面の04.png", "1番画面の05.jpg", "1番画面の06.jpg"]
 */
    /*하울데이터업로드부분 시작
    @IBAction func profileUpload(_ sender: Any) {
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        imagePick.allowsEditing = true
        imagePick.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagePick,animated: true,completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData()
        let imageName = Auth.auth().currentUser!.uid + "\(Int(NSDate.timeIntervalSinceReferenceDate * 1000)).jpg"
     //   let imageName = Auth.auth().currentUser!.uid; +"\(Int(NSDate.timeIntervalSinceReferenceDate * 1000)).jpg"
        let riverRef = Storage.storage().reference().child("ios_images").child(imageName)
        riverRef.putData(image!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            riverRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
                
            }
           
        }
        dismiss(animated: true, completion: nil)
    }하울 데이터 업로드 부분 끝*/
    
        /*
        riverRef.putData(image, metadata: nil) { metadata, error in
            if(error != nil)
            {
                
            } else {
                let downloadURL = metadata!.downloadURL
            }
        }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("picture")
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for picture in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let Object = picture.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let picturelink = Object?["link"]
                    
                    let picture = pictures(Title: Title as! String, link: picturelink as! String)
                    self.table.append(picture)
                    self.Tableview.reloadData()
                }
            }
        
        })
    
        
        
        // Do any additional setup after loading the view.
/*
            원래 부분
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        imgView.image = UIImage(named: images[0])
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(FirstViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(FirstViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
 */
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let picture: pictures
        
        picture = table[indexPath.row]
        cell.titleLabel.text = picture.Title
        
        return cell
    }
/*
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage<pageControl.numberOfPages-1) {
                    pageControl.currentPage = pageControl.currentPage + 1
                }
               // print("Swiped Left")
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage>0) {
                    pageControl.currentPage = pageControl.currentPage - 1
                }
              //  print("Swiped Right")
            default:
                break
            }
            
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
*/
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
