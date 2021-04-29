//
//  SessionManager.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-14.
//

import Foundation

class SessionManager {
    
    func getLoggedState() -> Bool {
      return UserDefaults.standard.bool(forKey: "USER_LOGGED")

    }

//    func SaveUserLogin(user: User){
//        UserDefaults.standard.setValue(true, forKey: "USER_LOGGED")
//
//    }

    func SaveUserLogin(){
        UserDefaults.standard.setValue(true, forKey: "USER_LOGGED")

    }

    func clearLoggedUserLogin(){
        UserDefaults.standard.setValue(false, forKey: "USER_LOGGED")
    }
}
