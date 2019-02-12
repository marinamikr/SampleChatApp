//
//  ShowViewController.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class ShowViewController: UIViewController {
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    var realm :Realm!
    
    var postArray: [User] = Array()
    
    var userName: String!
    var text: String!
    var image: UIImage!
    
    
    
    @IBOutlet weak var showImageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        userDefaults.register(defaults: ["isFirst":false])
        let isFirst: Bool = userDefaults.bool(forKey: "isFirst")
        if !isFirst {
            print(isFirst)
            performSegue(withIdentifier: "toSignUpViewController",sender: nil)
        }else{
            
            showImageTableView.dataSource = self
            showImageTableView.delegate = self
            //Identifierを設定する
            self.showImageTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
            
            
            DBRef = Database.database().reference()
            
            // Keyを指定して読み込み
            userName = realm.objects(UserRealm.self).first?.userName
            
            DBRef.child("Post").observe(.value, with: { (snapshot) in
                
                for itemSnapShot in snapshot.children  {
                    let snap = itemSnapShot as! DataSnapshot
                    let data = snap.value as! [String : AnyObject]
                    print(data["name"])
                    var icon = self.realm.objects(UserRealm.self).first?.iconImage
                    var post: User = User(text: data["name"] as! String, userName: self.userName, icon: icon!)
                    self.postArray.append(post)
                }
                self.showImageTableView.reloadData()
            })
        }
    }
}


extension ShowViewController: UITableViewDataSource,UITableViewDelegate {
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    //cellの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showImageTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.setContents(contents: postArray[indexPath.row].contents)
        cell.setName(name: postArray[indexPath.row].userName)
        cell.setImage(imageData: UIImage(data: postArray[indexPath.row].iconImage as Data)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
