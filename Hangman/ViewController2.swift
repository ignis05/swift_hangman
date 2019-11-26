//
//  ViewController2.swift
//  Hangman
//
//  Created by Mikołajczyk Grzegorz on 05/11/2019.
//  Copyright © 2019 Mikołajczyk Grzegorz. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITextFieldDelegate {
    
    var selected1:Int!
    var selected2:Int!
    var pickerData: [String: Array<String>] = [:]
    var cat:String!
    var subcat:String!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var input: UITextField!
    
    var keyword = "TEST"
    var guessed:Array<Character> = []
    var covered:Array<String> = []
    var imgs:Array<UIButton>=[]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cat = Array(pickerData.keys)[selected1]
        subcat = pickerData[cat]![selected2]
        
        categoryLabel.text = cat + " - " + subcat!
        categoryLabel.sizeToFit()
        
        input.delegate = self
        generateButtons()
        updateDisplay()
        // Do any additional setup after loading the view.
    }
    
    
    // start typing textField to generate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.deleteBackward()
        return true
    }
    
    func generateButtons(){
        for i in 1...6{
            let button : UIButton = UIButton()
            let img = UIImage(named : "\(i).jpg")
            let xd = (i-1) % 3
            let xdd = Int(floor(Double(i-1)/3))
            button.frame = CGRect(x:100 + 100*xd, y:300 + 100*xdd, width: 100, height: 100) // rozmiar i punkt wstwienia
            button.tag = i
            button.setBackgroundImage(img, for: UIControl.State.normal)
            button.isEnabled = false
            self.view.addSubview(button) //dodanie buttona do widoku
            imgs.append(button)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        let x:String = textField.text!
        if(x.count == 0){
            return false
        }
        makeGuess(x:Array(x.uppercased())[0])
        textField.deleteBackward()
        return false
    }
    
    func makeGuess(x:Character){
        guessed.append(x)
        
        if(keyword.contains(x)){
            
        }
        else {
            if(covered.count < 6){
                var rand:String = ""
                while true{
                    rand = "\(Int.random(in: 1...6))"
                    if(covered.contains(rand)){
                    }else{
                        break
                    }
                }
                covered.append(rand)
            }
        }
        
        
        updateDisplay()
    }
    
    func updateDisplay(){
        if(covered.count >= 6){
            let alert = UIAlertController(title: "Alert", message: "Przegrana", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        var string = ""
        var xddd = 0
        for char in keyword {
            if(guessed.contains(char)){
                string += String(char) + " "
                xddd = xddd + 1
            }
            else{
                string += "_ "
            }
        }
        wordLabel.text = string
        wordLabel.sizeToFit()
        for img in imgs{
            if covered.contains("\(img.tag)"){
                img.isEnabled = false
            }
            else {
                img.isEnabled = true
            }
        }
        
        if(xddd == keyword.count){
            let alert = UIAlertController(title: "Alert", message: "Wygrana", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
