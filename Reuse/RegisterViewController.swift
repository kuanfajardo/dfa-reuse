//
//  RegisterViewController.swift
//  Reuse
//
//  Created by Erica Chiu on 3/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var DormPicker: UIPickerView!
    let dorms = ["Baker","Burton Conner","East Campus","Macgregor","Maseeh","McCormick","New House","Next House","Random","Simmons", "Other"];
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dorms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dorms[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DormPicker.delegate = self
        DormPicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


