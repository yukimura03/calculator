//
//  ViewController.swift
//  calculator
//
//  Created by minagi on 2018/11/09.
//  Copyright © 2018 minagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button_division: UIButton!
    @IBOutlet weak var button_multiply: UIButton!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    var num:String = ""
    var numArray:Array = [Double]()
    var sign = ""
    var calcNum:Double = 0
    var countOfTapSign = 0
    
    var signTapped:Bool = false //記号を押した
    var Calculated:Bool = false //計算した
    var end:Bool = false //equalを押した＝計算終了した
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        num = "0"
        calcNum = 0
        sign = ""
        countOfTapSign = 0
        numArray = []
        label.text = num
        button_white()
        
        signTapped = false
        Calculated = false
        end = false

    }
    
    func button_white() {
        //記号の色を白にする
        button_plus.backgroundColor = UIColor.white
        button_minus.backgroundColor = UIColor.white
        button_multiply.backgroundColor = UIColor.white
        button_division.backgroundColor = UIColor.white
        signTapped = false
    }

    @IBAction func tapAC(_ sender: Any) {
        viewDidLoad()
    }

    
    @IBAction func tapNum(_ sender: UIButton) {
        //もしequalを押してたら一回リセットする
        if end == true {
            viewDidLoad()
        }
        //もしnumが0だったら一旦クリア
        if num == "0" {
            num = ""
        }
        //計算記号を押してあったら一旦クリア、計算記号押してないよーってする
        if signTapped == true {
            button_white()
            num = ""
            signTapped = false
        }
        
        //numに数字を入れる
        num += sender.titleLabel!.text!
        
        label.text = num
        
    }
    
    @IBAction func period(_ sender: Any) {
        //ちょっと保留
    }
    
    //算術記号に合わせて計算する！
    func calc() {
        if sign == "-" {
            num = "-" + num
        }
        numArray += [Double(num)!]
        calcNum = Double(numArray.reduce(0){$0 + $1})
        numArray = []
        numArray += [calcNum]
        calcNum = 0
        Calculated = true //計算しました
    }
    
    @IBAction func tapCalcSign(_ sender: UIButton) {
        //もしequalを押した後だったら、endを取り消して計算を続けるよ
        if end == true {
            end = false
        }
        
        if sign == "×" {
            calcNum = Double(numArray.last!) * Double(num)!
            numArray[numArray.count - 1] = calcNum
            calcNum = 0
        } else if sign == "÷" {
            calcNum = Double(numArray.last!) / Double(num)!
            numArray[numArray.count - 1] = calcNum
            calcNum = 0
        }
        
        //+-を押したらここまでの合計を表示する
        //*/を押したら掛け算開始からの計算結果を表示する
        
        if countOfTapSign != 0 {
            if (sender.titleLabel!.text! == "+" || sender.titleLabel!.text == "-") {
                calc()
            }
        } else {
            numArray += [Double(num)!]
        }
        label.text = String(numArray.last!)
        
        if signTapped == true {
            button_white()
        }
        sender.backgroundColor = UIColor.gray
        signTapped = true
        
        sign = sender.titleLabel!.text!
        countOfTapSign += 1
    }
    
    @IBAction func plus_minus(_ sender: Any) {

    }
    
    @IBAction func percent(_ sender: Any) {
        //後でね
    }
    
    @IBAction func tapEqual(_ sender: Any) {
        button_white() //ボタン白くします
        calc()
        label.text = String(numArray.last!)
        end = true //計算終了しました
        
    }
}

