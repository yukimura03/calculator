//
//  ViewController.swift
//  calculator
//
//  Created by minagi on 2018/11/09.
//  Copyright © 2018 minagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //完成したら消すとこ
    @IBOutlet weak var num1_label: UILabel!
    @IBOutlet weak var sign_label: UILabel!
    @IBOutlet weak var num2_label: UILabel!
    //ここまで
    
    @IBOutlet weak var label: UILabel!
    
    var num1:String = ""
    var sign:String = ""
    var num2:String = ""
    
    var selectSign:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }

    @IBAction func tapAC(_ sender: Any) {
        num1 = ""
        num2 = ""
        sign = ""
        label.text = ""
    }

    
    @IBAction func tapNum(_ sender: UIButton) {
        if selectSign == true {
            num1 = ""
            selectSign = false
        }
        
        num1 += sender.titleLabel!.text!
        num1_label.text = num1
        label.text = num1
        
        //num1 = String(Double(num1)! + Double(num2)!)
    }
    
    
    @IBAction func tapCalcSign(_ sender: UIButton) {
        if num2 == "" {
            num2 = "0"
        }
        //signに押した算術記号を代入
        sign = sender.titleLabel!.text!
        selectSign = true //いま代入したよ！
        
        num2 = String(Double(num1)! + Double(num2)!)

        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで

    }
    
    @IBAction func tapEqual(_ sender: Any) {
        
        num1 = String(Double(num1)! + Double(num2)!)
        label.text = num1
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
        
        
    }

    
//num1 + num2 = answer
    
}

