//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitriy Khomitskiy on 4/2/15.
//  Copyright (c) 2015 Dmitriy Khomitskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signOutputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    var num : Double = 0
    var isClear: Bool = true
    var sign : Signs? = nil
    
    enum Signs: String {
        case Plus = "+"
        case Minis = "-"
        case Divide = "/"
        case Multiply = "*"
    }
    
    @IBAction func numberAction(sender: UIButton) {
        if isClear {
            outToLabel(sender.titleLabel!.text!, sign:sign)
            isClear = false
        } else {
            outToLabel(outputLabel.text! + sender.titleLabel!.text!, sign:sign)
        }
    }
    
    @IBAction func commandAction(sender: UIButton) {
        if let tmpSign = sign {
            num = doWork(num, num2:(outputLabel.text! as NSString).doubleValue, sign:tmpSign)
        } else {
            num = (outputLabel.text! as NSString).doubleValue
        }
        sign = getSign(sender.titleLabel!.text!)
        isClear = true
        outToLabel("\(num)", sign:sign)
    }
    
    @IBAction func clear(sender: UIButton) {
        num = 0
        isClear = true
        sign = nil
        self.outToLabel("0", sign:Signs.Plus)
    }

    func outToLabel(numValue: String, sign:Signs?) {
        outputLabel.text! = numValue
        signOutputLabel.text! = "\(sign?.rawValue)"
    }
    
    func getSign(value: String) -> Signs? {
        if Signs.Plus.rawValue == value {
            return Signs.Plus
        }
        else if(Signs.Minis.rawValue == value) {
            return Signs.Minis
        }
        else if(Signs.Divide.rawValue == value) {
            return Signs.Divide
        }
        else if(Signs.Multiply.rawValue == value) {
            return Signs.Multiply
        }
        return nil
    }
    
    func doWork(num1:Double, num2:Double, sign:Signs) -> Double {
        switch(sign) {
        case .Plus:
            return num1 + num2
        case .Minis:
            return num1 - num2
        case .Divide:
            return num1 / num2
        case .Multiply:
            return num1 * num2
        }
    }
}
