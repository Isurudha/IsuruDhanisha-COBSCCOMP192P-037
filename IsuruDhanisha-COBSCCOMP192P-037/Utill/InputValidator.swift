//
//  InputValidator.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-26.
//

import Foundation

class InputValidator{
    
    static let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let nameReg = "[a-zA-Z ]{2,100}"
    static let mobileReg = "^(07)(0|1|2|5|6|7|8|0)[\\d]{7}$"
    
    static func isValidateEmail(email: String) -> Bool{
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailReg)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidateName(name: String) -> Bool{
        let compReg = NSPredicate(format: "SELF MATCHES %@", nameReg)
        return compReg.evaluate(with: name)
    }
    
    static func isValidatePassword(pass: String, minLenght: Int, maxLenght: Int) -> Bool{
        return pass.count >= minLenght && pass.count <= maxLenght
    }
    
    static func isValidateMobileNo(_ mobileNo: String) -> Bool{
        let mobReg = NSPredicate(format: "SELF MATCHES %@", mobileReg)
        return mobReg.evaluate(with: mobileNo)
    }
}
