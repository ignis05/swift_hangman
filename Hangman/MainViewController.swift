//
//  MainViewController.swift
//  Hangman
//
//  Created by Mikołajczyk Grzegorz on 05/11/2019.
//  Copyright © 2019 Mikołajczyk Grzegorz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    
    var pickerData: [String: Array<String>] = [:]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == picker1){
        return pickerData.count
        }
        else {
            let key = Array(pickerData.keys)[picker1.selectedRow(inComponent: 0)]
            return pickerData[key]!.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        if(pickerView == picker1){
            return Array(pickerData.keys)[row]
        }
        else {
            let key = Array(pickerData.keys)[picker1.selectedRow(inComponent: 0)]
            return pickerData[key]![row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == picker1){
            picker2.reloadAllComponents()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["Item 1":["SubItem 1-1","SubItem 1-2" ],"Item 2":["SubItem 2-1","SubItem 2-2" ]]
        
        self.picker1.delegate = self
        self.picker1.dataSource = self
        self.picker2.delegate = self
        self.picker2.dataSource = self
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
