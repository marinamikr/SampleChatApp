//
//  PostViewController.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class PostViewController: UIViewController {

    @IBOutlet weak var saveTextView: UITextView!
    
      var userName: String!
    
    var realm :Realm!
    
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //firebaseの初期化
        DBRef = Database.database().reference()
        //Realm初期化
         realm = try! Realm()
        //topの結果が取得できる
        let result = realm.objects(User.self).first
        userName = result?.userName
    }
    

    @IBAction func postButton(_ sender: Any) {
        let data :[String:String] = ["name":userName,"text":saveTextView.text]
        DBRef.child("Post").childByAutoId().setValue(data)
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
