//
//  ViewController.swift
//  calculator
//
//  Created by minagi on 2018/11/09.
//  Copyright © 2018 minagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var sign: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }

    @IBAction func tapAC(_ sender: Any) {
    }
    @IBAction func tapEqual(_ sender: Any) {
    }
    
    @IBAction func tapCalcSign(_ sender: UIButton) {
    }
    
    @IBAction func tapNum(_ sender: UIButton) {
    }
}

