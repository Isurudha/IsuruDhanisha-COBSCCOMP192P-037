//
//  LoginViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-13.
//

import UIKit
import Firebase
import Loaf

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btn_LoginClicked(_ sender: UIButton) {
        if !InputValidator.isValidateEmail(email: txtEmail.text ?? ""){
            Loaf("Invalid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidatePassword(pass: txtPassword.text ?? "" , minLenght: 6, maxLenght: 50){
            Loaf("Invalid Password", state: .error, sender: self).show()
            return
        }
        AuthenticateUser(email: txtEmail.text!, password: txtPassword.text!)
    }
        
    @IBAction func btn_FogotPasswordClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(identifier: "FogotPassword" )
               vc.modalPresentationStyle = .overFullScreen
               present(vc, animated: true)
    }
    
    @IBAction func btn_SingnupClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(identifier: "Signup" )
               vc.modalPresentationStyle = .overFullScreen
               present(vc, animated: true)
    }
    
    func AuthenticateUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
         
            if let err = error{
//                print (err.localizedDescription)
                Loaf("Invalid Username or Password", state: .error, sender: self).show()
                return
            }
            
            let sessionmanager = SessionManager()
            sessionmanager.SaveUserLogin()
            self.performSegue(withIdentifier: "Store", sender: nil)
        }
    }
    
}
