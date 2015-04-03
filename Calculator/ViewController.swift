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
            outToLabel(sender.titleLabel!.text!, sign)
            isClear = false
        } else {
            outToLabel(outputLabel.text! + sender.titleLabel!.text!, sign)
        }
    }
    
    @IBAction func commandAction(sender: UIButton) {
        if let tmpSign = sign {
            num = doWork(num, (outputLabel.text! as NSString).doubleValue, tmpSign)
        }
        
        if Signs.Plus.rawValue == sender.titleLabel!.text! {
            sign=Signs.Plus
        }
        else if(Signs.Munis.rawValue == sender.titleLabel!.text!) {
            sign=Signs.Munis
        }
        else if(Signs.Divide.rawValue == sender.titleLabel!.text!) {
            sign=Signs.Divide
        }
        else if(Signs.Multiply.rawValue == sender.titleLabel!.text!) {
            sign=Signs.Multiply
        }
        
        isClear = true
        num = outputLabel.text!.toInt()!
        signOutputLabel.text! = sender.titleLabel!.text!
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
