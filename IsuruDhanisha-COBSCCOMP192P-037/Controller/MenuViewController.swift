//
//  MenuViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-29.
//

import UIKit
import Firebase
import FirebaseStorage

class MenuViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var CategoryId: UIPickerView!
    @IBOutlet weak var txtDiscount: UITextField!
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: Selector(("didTapImageView")))
        ImageView.addGestureRecognizer(tap)
        
    }
    
    @IBAction func btnAddPressed(_ sender: Any) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        storage.child("Images/files.png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Faild to Upload")
                return
            }
            self.storage.child("Images/files.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else{
                    return
                }
                
                let urlString = url.absoluteString
                DispatchQueue.main.async {
                    self.ImageView.image = image
                }
                print("URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
            
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
               picker.sourceType = .photoLibrary
               picker.delegate = self
               picker.allowsEditing = true
               present(picker, animated: true)
    }
}
