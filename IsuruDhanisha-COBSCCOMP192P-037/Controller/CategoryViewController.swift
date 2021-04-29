//
//  CategoryViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-27.
//

import UIKit
import Firebase
import FirebaseDatabase
import Loaf

class CategoryViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var tblCategory: UITableView!
    
    var ref: DatabaseReference!
    
    var category: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCategory.delegate = self;
        tblCategory.dataSource = self;
        
        ref = Database.database().reference()
        tblCategory.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCellViewIdentifier")
        
        CategoryData()
        self.tblCategory.reloadData();
    }

    @IBAction func btnAdd(_ sender: Any) {
        let Cat = Category(id: "", Name: txtName.text ?? "")
        self.SaveCategory(category: Cat)
    }
    
    func SaveCategory(category: Category)
    {
        let OrderData = [
            "Id" : category.id,
            "Name" : category.Name]
        
        let randomInt = Int.random(in: 1..<10000)
        if self.txtName.text == "" {
            Loaf("Please enter Category", state: .error, sender: self).show()
            return
        }
        else
        {
            self.ref.child("Catagory").child("\(randomInt)").setValue(["Name": self.txtName.text!])
            {
                (error, ref) in
                
                    if let err = error{
                        print(err.localizedDescription)
                        Loaf("Data save failed!", state: .error, sender: self).show()
                        return
                    }
                    
                    Loaf("Data save successfully!", state: .success, sender: self).show{
                        type in
                        self.dismiss(animated: true, completion: nil)
                        self.txtName.text = "";
                    }
            }
        }
    }
}

extension CategoryViewController{
    func CategoryData(){
        ref.child("Catagory").observe(.value, with: {
            (snapshot) in
            print(snapshot.value)
            
            if let data = snapshot.value {
                if let CategoryItems = data as? [String: Any]{
                    self.category.removeAll();
                    for CategoryInfo in CategoryItems {
                        if let catInfo = CategoryInfo.value as? [String: Any]{
                            
                            let singleCategorytem = Category(
                                id: "",
                                Name: catInfo["Name"] as! String)
                            
                            self.category.append(singleCategorytem)
                        }
                    }
                    
                    self.tblCategory.reloadData()
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Confirm", message: "Are you sure want to delete the category?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                self.deleteCategory(id: self.category[indexPath.row].id)
            }))
                            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                            
            present(alert, animated: true, completion: nil)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func deleteCategory(id:String){
            let ref = Database.database().reference()
            ref.child("Catagory").child("\(id)").removeValue();
            self.tblCategory.reloadData()
    }
}

extension CategoryViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableView);
        print("Row At: \( self.category.count)")
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCategory.dequeueReusableCell(withIdentifier: "CategoryCellViewIdentifier", for: indexPath) as! CategoryTableViewCell
        cell.setUpView(category: category[indexPath.row])
        return cell
    }
}
