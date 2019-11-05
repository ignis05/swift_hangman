//
//  ViewController2.swift
//  Hangman
//
//  Created by Mikołajczyk Grzegorz on 05/11/2019.
//  Copyright © 2019 Mikołajczyk Grzegorz. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var selected1:Int!
    var selected2:Int!
    var pickerData: [String: Array<String>] = [:]
    var cat:String!
    var subcat:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cat = Array(pickerData.keys)[selected1]
        subcat = pickerData[cat]![selected2]
        
        print(cat)
        print(subcat)
        // Do any additional setup after loading the view.
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
