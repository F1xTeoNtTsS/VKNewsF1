//
//  ViewController.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/2/20.
//  Copyright © 2020 F1xTeoNtTsS. All rights reserved.
//

import UIKit
import VK_ios_sdk

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
    }

    @IBAction func signINTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

