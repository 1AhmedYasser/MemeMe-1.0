//
//  pickerViewController.swift
//  MemeMe 1.0
//
//  Created by Ahmed yasser on 4/10/19.
//  Copyright © 2019 Ahmed yasser. All rights reserved.
//

import Foundation
import UIKit

class pickerViewController : NSObject, UIPickerViewDelegate , UIPickerViewDataSource {
    
    // MARK: Controller properties
    // Selected value row of the picker view
    var selectedValueRow: Int = 0
    // picker data array
    var pickerData = [String]()
    // A dummy textfield to become the first responder when the user clicks the font button
    let dummy = UITextField(frame: CGRect.zero)
    
    // The text fields passed from the view controller
    var topText = UITextField()
    var bottomText = UITextField()

    // MARK: Default constructor
    override init() {
        super.init()
        // Do nothing , just initialize the controller
    }
    
    // MARK: 3 argument constructor
    /* Initialize the picker data and fill it and top and button text and the dummy text field
       and create a picker view and a toolbar with 3 buttons and make them the dummy text field input
       and accessory views
     */
    init(view: UIView,top: UITextField ,bottom: UITextField) {
        super.init()
        topText = top
        bottomText = bottom
        pickerData = fillPickerData()
        dummy.isHidden = true
        view.addSubview(dummy)
        let picker: UIPickerView
        picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        picker.backgroundColor = .lightGray
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        dummy.inputView = picker
        dummy.inputAccessoryView = toolBar
    }
    
    // MARK: Number of picker displayed columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: Number of picker data items
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // MARK: Picker data item at a specified picker view row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: Picker selected row
    // sets the selectedValueRow to the picker selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValueRow = row
    }
    
    // MARK: Fill Picker Data
    // A helper method that returns an array of iOS native font names
    func fillPickerData() -> [String] {
        var familyNames = [String]()
        let fontFamilyNames = UIFont.familyNames
        for name in fontFamilyNames {
            familyNames.append(name)
        }
        return familyNames
    }
    
    // MARK: Show Picker
    // Make the dummy text Field become the first responder
    func showPicker(){
        dummy.becomeFirstResponder()
    }
    
    // MARK: Done picking a font
    /* Change top and bottom text fields fonts to the selected font and resign the responder
     from the dummy text field
     */
    @objc func donePicker (sender:UIBarButtonItem){
        topText.font = UIFont(name: pickerData[selectedValueRow], size: 40)
        bottomText.font = UIFont(name: pickerData[selectedValueRow], size: 40)
        dummy.resignFirstResponder()
    }
    
    // MARK: Cancel picking a font
    // User canceled the font picker , just resign the responder from the dummy text field
    @objc func cancelPicker (sender:UIBarButtonItem){
        dummy.resignFirstResponder()
    }
}
