//
//  ViewController.swift
//  calculator
//
//  Created by minagi on 2018/11/09.
//  Copyright © 2018 minagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //答えを表示するラベル
    @IBOutlet weak var label: UILabel!
 
    //計算記号の色変える用セット
    @IBOutlet weak var button_division: UIButton!
    @IBOutlet weak var button_multiply: UIButton!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    
    func buttonColor_reset(){
        button_division.backgroundColor = UIColor.white
        button_multiply.backgroundColor = UIColor.white
        button_minus.backgroundColor = UIColor.white
        button_plus.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }
    
    @IBAction func tap_clear(_ sender: UIButton) {
    }
    
    @IBAction func input_num(_ sender: UIButton) {
    }
    
    @IBAction func tap_point(_ sender: Any) {
    }
    
    @IBAction func tap_plusOrMinus(_ sender: Any) {
    }
    
    @IBAction func input_calcSymbol(_ sender: UIButton) {
    }
    
    @IBAction func tap_percent(_ sender: Any) {
    }
    
    @IBAction func tap_equal(_ sender: Any) {
    }
    
    /*
   
    @IBOutlet weak var button_division: UIButton!
    @IBOutlet weak var button_multiply: UIButton!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var button_plus: UIButton!
 
    @IBOutlet weak var button_AC: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var num:String = ""
    var numArray:Array = [Double]()
    var sign = ""
    var calcNum:Double = 0
    var countOfTapSign = 0
    var numDisprayed:String = ""
    var minus:String = ""
    
    var tapNum:Bool = false
    var tapPoint:Bool = false
    var signTapped:Bool = false //記号を押した
    var Calculated:Bool = false //計算した
    var end:Bool = false //equalを押した＝計算終了した
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button_AC.setTitle("AC", for: .normal)
        num = "0"
        calcNum = 0
        sign = ""
        countOfTapSign = 0
        numArray = []
        label.text = num
        button_white()
        
        tapNum = false
        tapPoint = false
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

    @IBAction func tapAC(_ sender: UIButton) {
        if sender.titleLabel!.text! == "AC" {
            viewDidLoad()
        } else {
            if end == false {
                num = "0"
                label.text = num
            } else {
                end = false
                numArray = []
                numArray += [Double(num)!]
                label.text = "0"
                tapNum = false
            }
            switch sign {
            case "+":
                button_plus.backgroundColor = UIColor.gray
            case "-":
                button_minus.backgroundColor = UIColor.gray
            case "×":
                button_multiply.backgroundColor = UIColor.gray
            case "÷":
                button_division.backgroundColor = UIColor.gray
            default:
                break
            }
            signTapped = true
            button_AC.setTitle("AC", for: .normal)
            
        }
    }

 
    @IBAction func imputNum(_ sender: UIButton) {
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
        label.text = minus + num
        button_AC.setTitle("C", for: .normal)
    }
    
    @IBAction func point(_ sender: Any) {
        if tapPoint == false {
            num += "."
            tapPoint = true
            label.text = num
        }
    }
 
    //算術記号に合わせて計算する！
    func calc() {
        if sign == "-" {
            if minus == "-" {
                minus = ""
            } else {
                minus = "-"
            }
        }
        if minus == "-" {
            numArray += [Double("-" + num)!]
        } else {
            numArray += [Double(num)!]
        }
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
        //を押したら掛け算開始からの計算結果を表示する
 
        if countOfTapSign != 0 {
            if (sender.titleLabel!.text! == "+" || sender.titleLabel!.text == "-") {
                calc()
                indicate()
            } else {
                if minus == "-" {
                    numArray += [Double("-" + num)!]
                } else {
                    numArray += [Double(num)!]
                }
            }
        } else {
            numArray += [Double(num)!]
            indicate()
        }
 
        if signTapped == true {
            button_white()
        }
        sender.backgroundColor = UIColor.gray
        signTapped = true
        
        tapPoint = false
        sign = sender.titleLabel!.text!
        countOfTapSign += 1
    }
    
    @IBAction func plus_minus(_ sender: Any) {
        if signTapped == true {
            num = "0"
        }
        if minus == "-" {
            minus = ""
        } else {
            minus = "-"
        }
        label.text = minus + num
    }
    
    @IBAction func percent(_ sender: Any) {
        calcNum = Double(num)! / 100
        
        if sign == "" {//8%←このタイミング
            end = true
            sign = "%"
        } else if (sign == "+" || sign == "-") {//500+8%←このタイミング
            calcNum = numArray.last! * calcNum
        }
        label.text = String(calcNum)
        num = String(calcNum)
        calcNum = 0
        
    }
    
    func indicate() {
        numDisprayed = String(numArray.last!)
        
        if numDisprayed.suffix(2) == ".0" {
            label.text = String(numDisprayed.dropLast(2))
        } else {
            label.text = numDisprayed
        }
    }
    
    @IBAction func tapEqual(_ sender: Any) {
        button_white() //ボタン白くします
        if sign != "%" {
            
            if sign == "×" {
                calcNum = Double(numArray.last!) * Double(num)!
                numArray[numArray.count - 1] = calcNum
                calcNum = 0
            } else if sign == "÷" {
                calcNum = Double(numArray.last!) / Double(num)!
                numArray[numArray.count - 1] = calcNum
                calcNum = 0
            }

            if sign == "-" {
                if minus == "-" {
                    minus = ""
                } else {
                    minus = "-"
                }
            }
        
            if sign == "+" {
                numArray += [Double(num)!]
            } else if sign == "-" {
                numArray += [Double("-" + num)!]
            }
        
            calcNum = Double(numArray.reduce(0){$0 + $1})
            numArray = []
            numArray += [calcNum]
            calcNum = 0
            
            tapNum = false
            tapPoint = false
            Calculated = true //計算しました
            indicate()//答えを表示する
            end = true //計算終了しました
        }
    }
 */
}

