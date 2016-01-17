 //
//  ViewController.swift
//  passwordhacker
//
//  Created by Tatsunori Ono on 2015/05/17.
//  Copyright (c) 2015年 Tatsunori Ono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel1: UILabel! // 右から１番目
    @IBOutlet var resultLabel2: UILabel! // 右から２番目
    @IBOutlet var resultLabel3: UILabel! // 右から３番目
    @IBOutlet var resultLabel4: UILabel! // 右から４番目
    @IBOutlet var resultLabel5: UILabel! // 右から５番目
    
    @IBOutlet var countLabel: UILabel!
    
    var password = Int(arc4random_uniform(99999))
    var digits = [Int] ()
    var password2: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel1.text = "?"
        resultLabel2.text = "?"
        resultLabel3.text = "?"
        resultLabel4.text = "?"
        resultLabel5.text = "?"
        
        countLabel.text = "0"
        NSLog("passwordは....%d", password)
        password2 = password
        
        for  j in 0 ..< 5 {
            digits.append(password2 % 10) // j桁目の数字
            
            password2  /= 10
        }
        
    }
    
    
        // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start() {
        
        // 0-9999までのループ
        for i in 0 ..< 99999{
            NSLog("iの数字は...%d",i)
            
            // countLabel 
            countLabel.text =  String( i )
            
            NSRunLoop.mainRunLoop()
            .runUntilDate(NSDate(timeIntervalSinceNow:  0.0005))
            
            if  i/10000 == password/10000 {
                resultLabel5.text = String (digits [4])
            }
            if  i/1000 == password/1000{
                resultLabel4.text = String (digits [3])
            }
            if  i/100 == password/100 {
                resultLabel3.text = String (digits [2])
            }
            if  i/10 == password/10 {
                resultLabel2.text = String (digits [1])
            }
            if  i == password{
                resultLabel1.text = String (digits [0])
            }
            
            if i == password { // iとpasswordが一致したら
                 // passwordの桁ごとの数字
                
                NSLog("一の位は...%d", digits[0])
                NSLog("十の位は...%d", digits[1])
                NSLog("百の位は...%d", digits[2])
                NSLog("千の位は...%d", digits[3])
                NSLog("万の位は...%d", digits[4])
                
                resultLabel1.text =  String(digits[0])
                resultLabel2.text =  String(digits[1])
                resultLabel3.text =  String(digits[2])
                resultLabel4.text =  String(digits[3])
                resultLabel5.text =  String(digits[4])
                
                }
    
                    
                    
                    
                    
                
    }
    
}

 }