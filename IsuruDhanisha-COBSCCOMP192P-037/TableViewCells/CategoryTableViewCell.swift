//
//  CategoryTableViewCell.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-29.
//

import UIKit
import Kingfisher

protocol YourCellDelegate : class {
    func didpressdelete(_ tag: Int)}

class CategoryTableViewCell: UITableViewCell {


    @IBOutlet weak var txtCatName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpView(category: Category){
        txtCatName.text = category.Name
    }
    
}
