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
        print(string)
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
            button.tag = 12 //mozna dodac liczbowy tag
            button.setBackgroundImage(img, for: UIControl.State.normal) // dodanie tła
            self.view.addSubview(button) //dodanie buttona do widoku
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        let x:String = textField.text!
        print(x)
        if(x.count == 0){
            return false
        }
        makeGuess(x:Array(x.uppercased())[0])
        textField.deleteBackward()
        return false
    }
    
    func makeGuess(x:Character){
        guessed.append(x)
        updateDisplay()
    }
    
    func updateDisplay(){
        var string = ""
        for char in keyword {
            if(guessed.contains(char)){
                string += String(char) + " "
            }
            else{
                string += "_ "
            }
        }
        wordLabel.text = string
        wordLabel.sizeToFit()
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
