//
//  ViewController.swift
//  Calculator
//
//  Created by Shubh Patel on 2018-09-13.
//  Copyright © 2018 Shubh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var btn1: RoundButton!
//    @IBOutlet weak var btn2: RoundButton!
//    @IBOutlet weak var btn3: RoundButton!
//    @IBOutlet weak var btn4: RoundButton!
//    @IBOutlet weak var btn5: RoundButton!
//    @IBOutlet weak var btn6: RoundButton!
//    @IBOutlet weak var btn7: RoundButton!
//    @IBOutlet weak var btn8: RoundButton!
//    @IBOutlet weak var btn9: RoundButton!
//    @IBOutlet weak var btn0: RoundButton!
//    @IBOutlet weak var btnDot: RoundButton!
    
    var PLUS_TAG: Int = 10
    var MINUS_TAG: Int = 20
    var MUL_TAG: Int = 30
    var DIV_TAG: Int = 40
    var EQL_TAG: Int = 50
    var AC_TAG: Int = 100
    var PER_TAG: Int = 60
    var PLUS_MINUS_TAG: Int = 70
    var NO_OPERATOR_PRESSED: Int = 1000
    var MAX_RESULT_LENTGH = 12
    
    
    
    @IBOutlet weak var windowView: UIView!
    @IBOutlet weak var resultArea: UILabel!
    @IBOutlet weak var btnAC: RoundButton!
    @IBOutlet weak var btnPluMin: RoundButton!
    @IBOutlet weak var btnPer: RoundButton!
    
    @IBOutlet weak var btnPlus: RoundButton!
    @IBOutlet weak var btnMin: RoundButton!
    @IBOutlet weak var btnMul: RoundButton!
    @IBOutlet weak var btnDiv: RoundButton!
    @IBOutlet weak var btnEql: RoundButton!
    
    var hasDot: Bool = false
    var isOperatorPressed: Bool = false
    var isEqlPressed: Bool = false
    var pressedOperator: Int!
    var num1: Double = 0
    var num2: Double = 0
    var ans: Double = 0
    
    
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToInit();
        
        var swipeGesture = UISwipeGestureRecognizer()
        // Swipe (right and left)
        let direction: [UISwipeGestureRecognizer.Direction] = [.left, .right]
        for dir in direction{
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeView(_:)))
            windowView.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = dir
            windowView.isUserInteractionEnabled = true
            windowView.isMultipleTouchEnabled = true
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func swipeView(_ sender:UISwipeGestureRecognizer){
       
        //resultArea.text = "Test"
            
            if((resultArea.text?.count)! > 1){
                resultArea.text = String(resultArea.text?.dropLast() ?? "0")
            } else if(resultArea.text != "0"){
                resultArea.text = "0"
            }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnACclick(_ sender: RoundButton) {
        setToInit()
    }
    
    @IBAction func btnNumberClick(_ sender: RoundButton) {
       //var a: Int!
        if(isOperatorPressed){
                num1 = Double(resultArea.text!)!
                resultArea.text = "0"
                isOperatorPressed = false
        }
        
        if(isEqlPressed){
            setToInit()
        }
        
        if(resultArea.text == "0"){
            if(sender.tag == -1)
            {
                resultArea.text?.append(".")
                hasDot = true
            }
            else {
                resultArea.text = String(sender.tag)
            }
            
        } else {
            if(sender.tag == -1 && !hasDot && (resultArea.text?.count)! < MAX_RESULT_LENTGH - 1)
            {
                resultArea.text?.append(".")
                hasDot = true
            }
            if( sender.tag != -1 && (resultArea.text?.count)! < MAX_RESULT_LENTGH){
                resultArea.text?.append(String(sender.tag))
            }
            
        }
        
    }
    
    @IBAction func btnEqlClick(_ sender: RoundButton) {
        num2 = Double(resultArea.text!)!
        ans = performOperation(num1: num1, num2: num2, OPR_TAG: pressedOperator)
        resultArea.text = doubleRound(result: ans)
        isEqlPressed = true
    }
    
    
    @IBAction func btnPlusMinusClick(_ sender: RoundButton) {
        resultArea.text?.insert("-", at: resultArea.)
    }
    
    
    @IBAction func btnOperatorClick(_ sender: RoundButton){
        
       // sender.backgroundColor = UIColor(red: 0x00, green: 0x7A, blue: 0x80, alpha: 0xCC)
        if(num1 != 0){
             num2 = Double(resultArea.text!)!
            ans = performOperation(num1: num1, num2: num2, OPR_TAG: pressedOperator)
//                num2 = performOperation(num1: num1, num2: num2, OPR_TAG: pressedOperator)
                resultArea.text = doubleRound(result: ans)
                isOperatorPressed = false
            }
        isOperatorPressed = true
        
        switch sender.tag {
        case PLUS_TAG:
            pressedOperator = PLUS_TAG
            break;
        case MINUS_TAG:
            pressedOperator = MINUS_TAG
            break;
        case MUL_TAG:
            pressedOperator = MUL_TAG
            break;
        case DIV_TAG:
            pressedOperator = DIV_TAG
            break;
        default:
            pressedOperator = NO_OPERATOR_PRESSED
            break;
        }
        
    }
    

    
    //set Calculator to default state
    func setToInit(){
        
        resultArea.text = "0"
        hasDot = false
        isOperatorPressed = false
        isEqlPressed = false
        pressedOperator = 1000
        num1 = 0
        num2 = 0
        // set operators to null
        
    }
    
    func performOperation(num1: Double, num2: Double, OPR_TAG: Int) -> Double{
        var ans: Double = 0;
        
        switch OPR_TAG {
        case PLUS_TAG:
            ans = num1+num2
            
            break;
        case MINUS_TAG:
            ans = num1-num2
           
            break;
        case MUL_TAG:
            ans = num1*num2
            
            break;
        case DIV_TAG:
            //if (num2 != 0) { ans = num1/num2 }
            //else { ans = 0 }
            ans = num1/num2
            break;
        default:
            break;
    }
        return ans
    }
    
    func doubleRound(result: Double) -> String {
        let finalAns = String(format: "%g", result)
        return finalAns
    }
    
    func setOperatorUI(sender: RoundButton){
        
    }
}


