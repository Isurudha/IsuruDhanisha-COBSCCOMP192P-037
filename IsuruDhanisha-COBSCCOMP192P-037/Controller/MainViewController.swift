//
//  MainViewController.swift
//  IsuruDhanisha-COBSCCOMP192P-037
//
//  Created by Isuru Dhanisha  on 2021-04-26.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var Preview: UIView!
    @IBOutlet weak var Catogary: UIView!
    @IBOutlet weak var Menu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SegnentController(_ sender: UISegmentedControl) {
                switch sender.selectedSegmentIndex{
                case 0:
                    Preview.isHidden = false
                    Catogary.isHidden = true
                    Menu.isHidden = true
                case 1:
                    Preview.isHidden = true
                    Catogary.isHidden = false
                    Menu.isHidden = true
                case 2:
                    Preview.isHidden = true
                    Catogary.isHidden = true
                    Menu.isHidden = false
                default:
                    Preview.isHidden = false
                }
    }
}
