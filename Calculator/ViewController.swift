//
//  ViewController.swift
//  Calculator
//
//  Created by Navdeep chokan on 13/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    @IBOutlet weak var caculatorHistoryLbl: UILabel!
    var workings: String = ""
    var history: String = ""
    var x: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearall()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    func clearall(){
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
        caculatorHistoryLbl.text = ""
        history = ""
        x = 0
    }
    func addToWorking(value : String){
       workings = workings + value
    calculatorWorkings.text = workings
    }
    @IBAction func allClearBtnPress(_ sender: Any) {
        clearall()
    }
    
    @IBAction func oneClearBtnPress(_ sender: Any) {
        if(!workings.isEmpty){
            
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    @IBAction func divideBtnPress(_ sender: Any) {
        if replacechar(){
            
          
//            let c = "*"
            workings.removeLast()
            addToWorking(value : "/")
        }else{
            addToWorking(value : "/")
        }    }
    
    @IBAction func multiplyBtnPress(_ sender: Any) {
        
        if replacechar(){
            
//            let c = "*"
            workings.removeLast()
            addToWorking(value : "*")
        }else{
            addToWorking(value : "*")
        }
        
    }
    
    @IBAction func percentBtnPress(_ sender: Any) {
        addToWorking(value : "%")
        reset()
    }
    
    
    
    @IBAction func subtractBtnPress(_ sender: Any) {
//        addToWorking(value : "-")
        if replacechar(){
            
//            print("inreplace")
//            let c = "*"
            workings.removeLast()
            addToWorking(value : "-")
        }else{
            addToWorking(value : "-")
//            print("donnotreplace")
        }
    }
    @IBAction func addBtnPress(_ sender: Any) {
        if replacechar(){
            
//            print("inreplace")
//            let c = "*"
            workings.removeLast()
            addToWorking(value : "+")
        }else{
            addToWorking(value : "+")
//            print("donnotreplace")
        }
    }
    
    @IBAction func pointBtnPress(_ sender: Any) {
//        addToWorking(value : ".")
        if replacechar(){
            
//            print("inreplace")
//            let c = "*"
            workings.removeLast()
            addToWorking(value : ".")
        }else{
            addToWorking(value : ".")
//            print("donnotreplace")
        }
        
    }
    
    @IBAction func oneBtnPress(_ sender: Any) {
        addToWorking(value : "1")
        reset()
    }
    
    @IBAction func twoBtnPress(_ sender: Any) {
        addToWorking(value : "2")
        reset()
    }
    
    @IBAction func threeBtnPress(_ sender: Any) {
        addToWorking(value : "3")
        reset()
    }
    
    @IBAction func fourBtnPress(_ sender: Any) {
        addToWorking(value : "4")
        reset()
    }
    
    @IBAction func fiveBtnPress(_ sender: Any) {
        addToWorking(value : "5")
        reset()
    }
    
    @IBAction func sixBtnPress(_ sender: Any) {
        addToWorking(value : "6")
        reset()
    }
    
    @IBAction func sevenBtnPress(_ sender: Any) {
        addToWorking(value : "7")
        reset()
    }
    
    @IBAction func eightBtnPress(_ sender: Any) {
        addToWorking(value : "8")
        reset()
    }
    
    @IBAction func nineBtnPress(_ sender: Any) {
        addToWorking(value : "9")
        reset()
    }
    @IBAction func zeroBtnPress(_ sender: Any) {
        addToWorking(value : "0")
        reset()
    }
    
    func reset(){
        if validatedata(){
            let checkForPercent = workings.replacingOccurrences(of: "%", with: "*0.1")
            
            let expretion = NSExpression(format: checkForPercent)
            let result = expretion.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result : result)
            calculatorResults.text = resultString
            
        }else{
            
           // self.showToast(message: "Wrong Inpute")
            clearall()
        }
        
    }
    
    @IBAction func equalBtnPress(_ sender: Any) {
        if x == 1 {
            history.append("=" ?? "")
        }
        
        history.append(calculatorWorkings.text ?? "")
        workings = calculatorResults.text ?? ""
        calculatorWorkings.text = workings
        
        caculatorHistoryLbl.text = history
        x = 1
//        if replacechar(){
//
//            print("inreplace")
//            let c = "*"
//            workings.removeLast()
//            addToWorking(value : "=")
//        }else{
//            addToWorking(value : "=")
//            print("donnotreplace")
//        }
//        reset()
    }
    func formatResult(result : Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0 ){
            return String(format: "%.0f", result)
        }else{
            
            return String(format: "%.2f", result)
        }
    }
    
    func replacechar()->Bool{
//        print("infunc")
        if workings.last == "*" || workings.last == "/" || workings.last == "+"  || workings.last == "-" || workings.last == "=" {
//            print("inif")
            return true
        }else {
//            print("inelse")
            return false
            
            
        }
        
    }
    
    func validatedata()->Bool {
        
        
        var count = 0
        var functionCharIndex = [Int]()
        for char in workings
        {
            if (specialChar(char: char)){
                
                
                functionCharIndex.append(count)
            }
            count += 1
        }
        var previous: Int = -1
        
        for index in functionCharIndex {
            if (index == 0){
                return false
            }
            if index == workings.count-1{
                return false
            }
            if previous != -1{
                
                if index - previous == 1{
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialChar(char: Character)->Bool
    {
        if char == "*" {
            return true
        }
        if char == "-" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        return false
    }
    
    
    
}
