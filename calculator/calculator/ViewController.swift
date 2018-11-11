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
    
    var num1:String = ""
    var sign:String = ""
    var num2:String = ""
    
    var selectSign:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }

    @IBAction func tapAC(_ sender: Any) {
        num1 = ""
        num2 = ""
        sign = ""
        label.text = "0"
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
        
    }

    
    @IBAction func tapNum(_ sender: UIButton) {

        if selectSign == true {
            //記号の色を白にする
            button_plus.backgroundColor = UIColor.white
            button_minus.backgroundColor = UIColor.white
            button_multiply.backgroundColor = UIColor.white
            button_division.backgroundColor = UIColor.white
            
            //num1をリセットしてから数字を入れる準備
            num2 = ""
            selectSign = false
        }
        
        num2 += sender.titleLabel!.text!
        num2_label.text = num2
        label.text = num2
    }
    
    //算術記号に合わせて計算する
    func calc() {
        if num1 == "" {
            num1 = num2
        } else {
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
        label.text = num1
    }
    
    
    @IBAction func tapCalcSign(_ sender: UIButton) {
        //num1が空欄(=計算機を開いたばかりorACしたばっかり）だったらnum2をnum1にコピー
        if num1 == "" {
            num1 = num2
        }
        
        sign = sender.titleLabel!.text! //signに押した算術記号を代入
        num2 = num1 //記号を押したらnum2にnum1（labelに表示されてる数字）を代入
        selectSign = true //記号押したよ！
        
        //ボタンの色を変える
        if selectSign == true {
            button_plus.backgroundColor = UIColor.white
            button_minus.backgroundColor = UIColor.white
            button_multiply.backgroundColor = UIColor.white
            button_division.backgroundColor = UIColor.white
        }
        sender.backgroundColor = UIColor.blue
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで

    }
    
    @IBAction func tapEqual(_ sender: Any) {
        
        calc()
        label.text = num1
        
        //後で消すとこ
        num2_label.text = num2
        num1_label.text = num1
        sign_label.text = sign
        //ここまで
        
        
    }
}

