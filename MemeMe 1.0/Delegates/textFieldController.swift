//
//  textFieldController.swift
//  MemeMe 1.0
//
//  Created by Ahmed yasser on 4/10/19.
//  Copyright © 2019 Ahmed yasser. All rights reserved.
//

import Foundation
import UIKit

class textFieldController: NSObject ,UITextFieldDelegate {
    
    // MARK: First responder notification
    // Check and remove the default text fields values
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    // MARK: Keyboard return key custom behavior
    // Resigns responder when the user presses return on the keyboard (Closes keyboard)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}
