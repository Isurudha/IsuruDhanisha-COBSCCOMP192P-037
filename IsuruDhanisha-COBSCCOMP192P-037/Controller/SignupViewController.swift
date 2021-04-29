//
//  SignupViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-13.
//

import UIKit
import Firebase
import Loaf

class SignupViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRePassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    @IBAction func btn_LoginClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func registerUser(user: User){
        Auth.auth().createUser(withEmail: user.userEmail, password: user.userPassword) { authResult, error in
            if let err = error{
                print(err.localizedDescription)
                Loaf("User sign up failed!", state: .error, sender: self).show()
                return
            }
            self.saveUserData(user: user)
        }
    }
    
    @IBAction func btn_SingupClicked(_ sender: UIButton) {
        
        if !InputValidator.isValidateName(name: txtName.text ?? ""){
            Loaf("Invalid Name", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidateEmail(email: txtEmail.text ?? ""){
            Loaf("Invalid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidateMobileNo(txtPhone.text ?? ""){
            Loaf("Invalid Phone No", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidatePassword(pass: txtPassword.text ?? "" , minLenght: 6, maxLenght: 50){
            Loaf("Invalid Password", state: .error, sender: self).show()
            return
        }
        let user = User(username: txtName.text ?? "", userEmail: txtEmail.text ?? "", userPassword: txtPassword.text ?? "" , userPhone: txtPhone.text ?? "")
        
        registerUser(user: user)
    }
    
    func saveUserData(user: User){
        let userData = [
            "Username" : user.username,
            "UserEmail" : user.userEmail,
            "UserPhone" : user.userPhone,
            "UserPassword" : user.userPassword]
        
        self.ref.child("users").child(user.userEmail.replacingOccurrences(of: "@", with: "_")).setValue(user){
            (error, ref) in
            
            if let err = error{
                print(err.localizedDescription)
                Loaf("User sign up failed!", state: .error, sender: self).show()
                return
            }
            
            Loaf("User sign up successfully!", state: .success, sender: self).show{
                type in
                self.dismiss(animated: true, completion: nil)
            } 
        }
    }
}
