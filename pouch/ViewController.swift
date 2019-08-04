//
//  ViewController.swift
//  pouch
//
//  Created by Damien Hervieux on 2019/07/21.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CurrentMonth: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentMonth.text = getCurrentMonth()
        // Do any additional setup after loading the view.
    }
    
    func getCurrentMonth() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }

}

