//
//  ShowViewController.swift
//  SampleChatApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.register(defaults: ["isFirst":false])
        let isFirst: Bool = userDefaults.bool(forKey: "isFirst")
        if !isFirst {
            print(isFirst)
            performSegue(withIdentifier: "toSignUpViewController",sender: nil)
        }

        // Do any additional setup after loading the view.
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
