//
//  ViewController.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController{
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userNameTextField.delegate = self as! UITextFieldDelegate
        iconImageView.isUserInteractionEnabled = true
        iconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.showImage(_:))))
        
        
    }
    
    @objc func showImage(_ sender: UITapGestureRecognizer) {
        print("タップ")
        let ipc = UIImagePickerController()
        ipc.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        ipc.sourceType = UIImagePickerController.SourceType.photoLibrary
        //編集を可能にする
        ipc.allowsEditing = true
        self.present(ipc,animated: true, completion: nil)
    }
    
    
    @IBAction func makeButton(_ sender: Any) {
        userDefaults.set(true, forKey: "isFirst")
        userDefaults.synchronize()
        
        
        let realm = try! Realm()
        
        let saveData = UserRealm()
        saveData.userName = userNameTextField.text
        saveData.iconImage = iconImageView.image?.jpegData(compressionQuality: 1.0) as! NSData
        try! realm.write() {
            realm.add(saveData)
        }
        
        navigationController?.popViewController(animated: true)
    }

}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let pickedImage = info[.originalImage]
            as? UIImage {
            iconImageView.image = pickedImage
        }
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
}

