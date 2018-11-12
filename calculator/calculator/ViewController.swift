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
    
    
    @IBOutlet weak var button_division: UIButton!
    @IBOutlet weak var button_multiply: UIButton!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    var num1:String = "0"
    var sign:String = ""
    var num2:String = "0"
    
    var selectSign:Bool = false
    var Calculated:Bool = false
    var sign_num:Bool = false
    var end:Bool = false
    var display:String = "num1"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        num1 = "0"
        num2 = "0"
        sign = ""
        label.text = num1
        display = "num1"
        button_white()
        selectSign = false
        Calculated = false
        sign_num = false
        end = false
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
    }
    
    func button_white() {
        //記号の色を白にする
        button_plus.backgroundColor = UIColor.white
        button_minus.backgroundColor = UIColor.white
        button_multiply.backgroundColor = UIColor.white
        button_division.backgroundColor = UIColor.white
        selectSign = false
    }

    @IBAction func tapAC(_ sender: Any) {
        viewDidLoad()
    }

    
    @IBAction func tapNum(_ sender: UIButton) {
        if end == true {
            viewDidLoad()
        }
        
        if num2 == "0" {
            num2 = ""
        }

        if selectSign == true {
            button_white()
            sign_num = true
            //num2をリセットしてから数字を入れる準備
            if num2 == "-0.0" {
                num2 = "-"
            } else {
                num2 = ""
            }
        }
        
        num2 += sender.titleLabel!.text!
        num2_label.text = num2
        label.text = num2
        display = "num2"
    }
    
    //算術記号に合わせて計算する
    func calc() {
        if sign == "+" {
            num1 = String(Double(num1)! + Double(num2)!)
        } else if sign == "-" {
            num1 = String(Double(num1)! - Double(num2)!)
        } else if sign == "÷" {
            num1 = String(Double(num1)! / Double(num2)!)
        } else if sign == "×" {
            num1 = String(Double(num1)! * Double(num2)!)
        }
    }
    
    
    @IBAction func tapCalcSign(_ sender: UIButton) {
        
        if end == true {
            end = false
        }
        
        if sign_num == true {
            calc()
            Calculated = true
            sign_num = false
        }
        
        sign = sender.titleLabel!.text! //signに押した算術記号を代入
        
        //ボタンの色を変える
        if selectSign == true {
            button_white()
        }
        sender.backgroundColor = UIColor.blue
        selectSign = true //記号押したよ！
        
        
        if Calculated == true {
            num2 = num1
            Calculated = false
        } else {
            num1 = num2
        }
        label.text = num2
        display = "num2"
        
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで

    }
    
    @IBAction func plus_minus(_ sender: Any) {
        if selectSign == true {
            num2 = "0"
        }
            if display == "num1" {
                num1 = String(Double(num1)! * -1)
                label.text = num1
            } else {
                num2 = String(Double(num2)! * -1)
                label.text = num2
            }
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
    }
    
    @IBAction func tapEqual(_ sender: Any) {
        button_white()
        
        calc()
        label.text = num1
        sign_num = false
        Calculated = true
        end = true
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
        
        
    }
}

