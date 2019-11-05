//
//  MainViewController.swift
//  Hangman
//
//  Created by Mikołajczyk Grzegorz on 05/11/2019.
//  Copyright © 2019 Mikołajczyk Grzegorz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        return Array(pickerData.keys)[row]
    }

    @IBOutlet weak var picker1: UIPickerView!
    
    var pickerData: [String: Array<String>] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["Item 1":["SubItem 1-1","SubItem 1-2" ],"Item 2":["SubItem 2-1","SubItem 2-2" ]]
        
        self.picker1.delegate = self
        self.picker1.dataSource = self
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
