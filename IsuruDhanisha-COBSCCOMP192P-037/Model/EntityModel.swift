//
//  EntityModel.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-13.
//

import Foundation

struct User {
    var username: String
    var userEmail: String
    var userPassword: String
    var userPhone: String
}

struct FoodItem {
    var _id: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var discount: Int
    var Image: String
    var category: String
}

struct Category {
    var id: String
    var Name: String
}

struct Items {
    var id: String
    var Name: String
    var Description: String
    var Price: Decimal
    var Image: String
    var CategoryId: Int
    var Discount: Decimal
}

//class User1 {
//
//    var username: String
//    var userEmail: String
//    var userPassword: String
//    var userPhone: String
//
//    internal init(username: String, userEmail: String, userPassword: String, userPhone: String) {
//        self.username = username
//        self.userEmail = userEmail
//        self.userPassword = userPassword
//        self.userPhone = userPhone
//    }
//}
