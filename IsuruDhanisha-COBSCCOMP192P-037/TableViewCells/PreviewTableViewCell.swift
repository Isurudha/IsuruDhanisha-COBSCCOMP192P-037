//
//  PreviewTableViewCell.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-15.
//

import UIKit
import Kingfisher

class PreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var ViewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(foodItem: FoodItem){
        lblFoodName.text = foodItem.foodName
        lblFoodDescription.text = foodItem.foodDescription
        lblFoodPrice.text = "LKR \(foodItem.foodPrice)"
        ImgFood.kf.setImage(with: URL(string: foodItem.Image))
        
        if foodItem.discount > 0 {
            ViewContainer.isHidden = false
            lblDiscount.text = "\(foodItem.discount)%"
        }else {
            ViewContainer.isHidden = true
            lblDiscount.text = ""
        }
    }
    
}
