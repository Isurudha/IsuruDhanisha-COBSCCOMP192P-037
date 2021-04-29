//
//  PreviewViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-15.
//

import UIKit
import Firebase

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var tblPreview: UITableView!
    
    var ref: DatabaseReference!

    
    var foodItems: [FoodItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblPreview.register(UINib(nibName: "PreviewTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviewCellIdentifier")
        
        ref = Database.database().reference()
        getFoodItemData()
    }
    
}

extension PreviewViewController {
    func getFoodItemData() {
        ref.child("foodItems").observe(.value, with:{
            (snapshot) in
            
            if let data = snapshot.value {
                if let foodItems = data as? [String: Any]{
                    for itemInfo in foodItems {
                        if let foodInfo = itemInfo.value as? [String: Any]{
                            
                            let singleFoodItem = FoodItem(
                                _id: "",
                                foodName: foodInfo["name"] as! String,
                                foodDescription: foodInfo["description"] as! String,
                                foodPrice: foodInfo["price"] as! Double,
                                discount: foodInfo["discount"] as! Int,
                                Image: foodInfo["image"] as! String,
                                category: foodInfo["category"] as! String)
                            
                            self.foodItems.append(singleFoodItem)
                        }
                    }
                    
                    self.tblPreview.reloadData()
                }
            }
        })
    }
}

extension PreviewViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPreview.dequeueReusableCell(withIdentifier: "PreviewCellIdentifier", for: indexPath) as! PreviewTableViewCell
        cell.setupView(foodItem: foodItems[indexPath.row])
        return cell
    }
}
