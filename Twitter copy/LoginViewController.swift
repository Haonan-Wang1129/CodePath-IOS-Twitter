//
//  LoginViewController.swift
//  Twitter
//
//  Created by Haonan Wang on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: Any) {
        let loginUrl = "https://api.twitter.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "loggedIn")
        TwitterAPICaller.client?.login(url: loginUrl, success: {self.performSegue(withIdentifier: "loginToHome", sender: self)}, failure: {(Error) in print("cannot login to account")})
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
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
