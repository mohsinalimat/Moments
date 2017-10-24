//
//  TabBar.swift
//  Moments
//
//  Created by user on 18/07/1939 Saka.
//  Copyright © 1939 Saka user. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationItem.setHidesBackButton(true, animated: false)
        
    }
}
